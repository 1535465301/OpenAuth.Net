using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using Newtonsoft.Json.Linq;
using OpenAuth.App.Flow;
using OpenAuth.App.Request;
using OpenAuth.App.Response;
using OpenAuth.App.SSO;
using OpenAuth.Repository.Domain;

namespace OpenAuth.App
{
    /// <summary>
    /// ������ʵ�������
    /// </summary>
    public class FlowInstanceApp : BaseApp<FlowInstance>
    {
        
        #region ���̴���API
        /// <summary>
        /// ����һ��ʵ��
        /// </summary>
        /// <returns></returns>
        public bool CreateInstance(JObject obj)
        {
            var flowInstance = obj.ToObject<FlowInstance>();

            //��ȡ�ύ�ı�����
            var frmdata = new JObject();
            foreach (var property in obj.Properties().Where(U => U.Name.Contains("data_")))
            {
                frmdata[property.Name] = property.Value;
            }
            flowInstance.FrmData = JsonHelper.Instance.Serialize(frmdata);

            //��������ʵ��
            var wfruntime = new FlowRuntime(flowInstance);
            var user = AuthUtil.GetCurrentUser();

            #region ��������ʵ���ı䵱ǰ�ڵ�״̬
            flowInstance.ActivityId = wfruntime.runtimeModel.nextNodeId;
            flowInstance.ActivityType = wfruntime.GetNextNodeType();//-1�޷�����,0��ǩ��ʼ,1��ǩ����,2һ��ڵ�,4�������н���
            flowInstance.ActivityName = wfruntime.runtimeModel.nextNode.name;
            flowInstance.PreviousId = wfruntime.runtimeModel.currentNodeId;
            flowInstance.CreateUserId = user.User.Id;
            flowInstance.CreateUserName = user.User.Account;
            flowInstance.MakerList = (wfruntime.GetNextNodeType() != 4 ? GetMakerList(wfruntime) : "");//��ǰ�ڵ��ִ�е�����Ϣ
            flowInstance.IsFinish = (wfruntime.GetNextNodeType() == 4 ? 1 : 0);
            #endregion

            #region ���̲�����¼
            FlowInstanceOperationHistory processOperationHistoryEntity = new FlowInstanceOperationHistory
            {
                InstanceId = flowInstance.Id,
                Content = "��������"
                          + user.User.Name
                          + "������һ�����̽��̡�"
                          + flowInstance.Code + "/"
                          + flowInstance.CustomName + "��"
            };

            #endregion

            #region ��ת��¼

            FlowInstanceTransitionHistory processTransitionHistoryEntity = new FlowInstanceTransitionHistory
            {
                InstanceId = flowInstance.Id,
                FromNodeId = wfruntime.runtimeModel.currentNodeId,
                FromNodeName = wfruntime.runtimeModel.currentNode.name,
                FromNodeType = wfruntime.runtimeModel.currentNodeType,
                ToNodeId = wfruntime.runtimeModel.nextNodeId,
                ToNodeName = wfruntime.runtimeModel.nextNode.name,
                ToNodeType = wfruntime.runtimeModel.nextNodeType,
                TransitionSate = 0
            };
            processTransitionHistoryEntity.IsFinish = (processTransitionHistoryEntity.ToNodeType == 4 ? 1 : 0);
            #endregion

            UnitWork.Add(flowInstance);
            UnitWork.Add(processOperationHistoryEntity);
            UnitWork.Add(processTransitionHistoryEntity);
            UnitWork.Save();
            return true;
        }

        /// <summary>
        /// �ڵ����
        /// </summary>
        /// <param name="instanceId"></param>
        /// <returns></returns>
        public bool NodeVerification(string instanceId, bool flag, string description = "")
        {
            FlowInstance flowInstance = Get(instanceId);
            FlowInstanceOperationHistory flowInstanceOperationHistory = new FlowInstanceOperationHistory();//������¼
            FlowInstanceTransitionHistory processTransitionHistoryEntity = null;//��ת��¼

            FlowRuntime wfruntime = new FlowRuntime(flowInstance);

            var user = AuthUtil.GetCurrentUser().User;
            var tag = new Tag
            {
                UserName = user.Name,
                UserId = user.Id,
                Description = description
            };
            #region ��ǩ
            if (flowInstance.ActivityType == 0)//��ǩ
            {
                tag.Taged = 1;
                wfruntime.MakeTagNode(wfruntime.runtimeModel.currentNodeId, tag);//��ǵ�ǰ�ڵ�ͨ��
                ///Ѱ����Ҫ��˵Ľڵ�Id
                string _VerificationNodeId = "";
                List<string> _nodelist = wfruntime.GetCountersigningNodeIdList(wfruntime.runtimeModel.currentNodeId);
                string _makerList = "";
                foreach (string item in _nodelist)
                {
                    _makerList = GetMakerList(wfruntime.runtimeModel.nodes[item], wfruntime.runtimeModel.flowInstanceId);
                    if (_makerList != "-1")
                    {
                        var id = AuthUtil.GetCurrentUser().User.Id;
                        foreach (string one in _makerList.Split(','))
                        {
                            if (id == one || id.IndexOf(one) != -1)
                            {
                                _VerificationNodeId = item;
                                break;
                            }
                        }
                    }
                }

                if (_VerificationNodeId != "")
                {
                    if (flag)
                    {
                        tag.Taged = 1;
                        flowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.nodes[_VerificationNodeId].name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "��ͬ��,��ע��" + description;
                    }
                    else
                    {
                        tag.Taged = -1;
                        flowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.nodes[_VerificationNodeId].name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "����ͬ��,��ע��" + description;
                    }


                    string confluenceres = wfruntime.NodeConfluence(_VerificationNodeId, tag);
                    
                    switch (confluenceres)
                    {
                        case "-1"://��ͨ��
                            flowInstance.IsFinish = 3;
                            break;
                        case "1"://�ȴ�
                            break;
                        default://ͨ��
                            flowInstance.PreviousId = flowInstance.ActivityId;
                            flowInstance.ActivityId = wfruntime.runtimeModel.nextNodeId;
                            flowInstance.ActivityType = wfruntime.runtimeModel.nextNodeType;//-1�޷�����,0��ǩ��ʼ,1��ǩ����,2һ��ڵ�,4�������н���
                            flowInstance.ActivityName = wfruntime.runtimeModel.nextNode.name;
                            flowInstance.IsFinish = (wfruntime.runtimeModel.nextNodeType == 4 ? 1 : 0);
                            flowInstance.MakerList = (wfruntime.runtimeModel.nextNodeType == 4 ? "" : GetMakerList(wfruntime));//��ǰ�ڵ��ִ�е�����Ϣ

                            #region ��ת��¼

                            processTransitionHistoryEntity = new FlowInstanceTransitionHistory
                            {
                                FromNodeId = wfruntime.runtimeModel.currentNodeId,
                                FromNodeName = wfruntime.runtimeModel.currentNode.name,
                                FromNodeType = wfruntime.runtimeModel.currentNodeType,
                                ToNodeId = wfruntime.runtimeModel.nextNodeId,
                                ToNodeName = wfruntime.runtimeModel.nextNode.name,
                                ToNodeType = wfruntime.runtimeModel.nextNodeType,
                                TransitionSate = 0
                            };
                            processTransitionHistoryEntity.IsFinish = (processTransitionHistoryEntity.ToNodeType == 4 ? 1 : 0);
                            #endregion
                                
                            break;
                    }
                }
                else
                {
                    throw (new Exception("����쳣,�Ҳ�����˽ڵ�"));
                }
            }
            #endregion

            #region һ�����
            else//һ�����
            {
                if (flag)
                {
                    tag.Taged = 1;
                    wfruntime.MakeTagNode(wfruntime.runtimeModel.currentNodeId, tag);
                    flowInstance.PreviousId = flowInstance.ActivityId;
                    flowInstance.ActivityId = wfruntime.runtimeModel.nextNodeId;
                    flowInstance.ActivityType = wfruntime.runtimeModel.nextNodeType;
                    flowInstance.ActivityName = wfruntime.runtimeModel.nextNode.name;
                    flowInstance.MakerList = wfruntime.runtimeModel.nextNodeType == 4 ? "" : GetMakerList(wfruntime);//��ǰ�ڵ��ִ�е�����Ϣ
                    flowInstance.IsFinish = (wfruntime.runtimeModel.nextNodeType == 4 ? 1 : 0);
                    #region ��ת��¼

                    processTransitionHistoryEntity = new FlowInstanceTransitionHistory
                    {
                        FromNodeId = wfruntime.runtimeModel.currentNodeId,
                        FromNodeName = wfruntime.runtimeModel.currentNode.name,
                        FromNodeType = wfruntime.runtimeModel.currentNodeType,
                        ToNodeId = wfruntime.runtimeModel.nextNodeId,
                        ToNodeName = wfruntime.runtimeModel.nextNode.name,
                        ToNodeType = wfruntime.runtimeModel.nextNodeType,
                        TransitionSate = 0
                    };
                    processTransitionHistoryEntity.IsFinish = (processTransitionHistoryEntity.ToNodeType == 4 ? 1 : 0);
                    #endregion

                        
                    flowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.currentNode.name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "��ͬ��,��ע��" + description;
                }
                else
                {
                    flowInstance.IsFinish = 3; //��ʾ�ýڵ㲻ͬ��
                    tag.Taged = -1;
                    wfruntime.MakeTagNode(wfruntime.runtimeModel.currentNodeId,tag);

                    flowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.currentNode.name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "����ͬ��,��ע��" + description;
                }
            }
            #endregion

            flowInstance.SchemeContent = JsonHelper.Instance.Serialize(wfruntime.runtimeModel.schemeContentJson);

            UnitWork.Update(flowInstance);
            UnitWork.Add(flowInstanceOperationHistory);
            UnitWork.Add(processTransitionHistoryEntity);
            UnitWork.Save();
            return true;
        }
        /// <summary>
        /// ����
        /// </summary>
        /// <param name="processId"></param>
        /// <param name="nodeId"></param>
        /// <param name="description"></param>
        /// <returns></returns>
        public bool NodeReject(string processId, string nodeId, string description = "")
        {
            FlowInstance flowInstance = Get(processId);
            FlowInstanceOperationHistory flowInstanceOperationHistory = new FlowInstanceOperationHistory();
            FlowInstanceTransitionHistory processTransitionHistoryEntity = null;

            FlowRuntime wfruntime = new FlowRuntime(flowInstance);


            string resnode = "";
            if (nodeId == "")
            {
                resnode = wfruntime.RejectNode();
            }
            else
            {
                resnode = nodeId;
            }

            var user = AuthUtil.GetCurrentUser().User;
            var tag = new Tag
            {
                Description = description,
                Taged = 0,
                UserId = user.Id,
                UserName = user.Name
            };

            wfruntime.MakeTagNode(wfruntime.runtimeModel.currentNodeId, tag);
            flowInstance.IsFinish = 4;//4��ʾ���أ���Ҫ�����������ύ����
            if (resnode != "")
            {
                flowInstance.PreviousId = flowInstance.ActivityId;
                flowInstance.ActivityId = resnode;
                flowInstance.ActivityType = wfruntime.GetNodeType(resnode);//-1�޷�����,0��ǩ��ʼ,1��ǩ����,2һ��ڵ�,4�������н���
                flowInstance.ActivityName = wfruntime.runtimeModel.nodes[resnode].name;
                flowInstance.MakerList = GetMakerList(wfruntime.runtimeModel.nodes[resnode], flowInstance.PreviousId);//��ǰ�ڵ��ִ�е�����Ϣ
                #region ��ת��¼
                processTransitionHistoryEntity = new FlowInstanceTransitionHistory();
                processTransitionHistoryEntity.FromNodeId = wfruntime.runtimeModel.currentNodeId;
                processTransitionHistoryEntity.FromNodeName = wfruntime.runtimeModel.currentNode.name;
                processTransitionHistoryEntity.FromNodeType = wfruntime.runtimeModel.currentNodeType;
                processTransitionHistoryEntity.ToNodeId = wfruntime.runtimeModel.nextNodeId;
                processTransitionHistoryEntity.ToNodeName = wfruntime.runtimeModel.nextNode.name;
                processTransitionHistoryEntity.ToNodeType = wfruntime.runtimeModel.nextNodeType;
                processTransitionHistoryEntity.TransitionSate = 1;//
                processTransitionHistoryEntity.IsFinish = (processTransitionHistoryEntity.ToNodeType == 4 ? 1 : 0);
                #endregion
            }
            var data = new
            {
                SchemeContent = wfruntime.runtimeModel.schemeContentJson.ToString(),
                frmData = (flowInstance.FrmType == 0 ? wfruntime.runtimeModel.frmData : null)
            };
            flowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.currentNode.name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "������,��ע��" + description;

            UnitWork.Add(flowInstance);
            UnitWork.Add(flowInstanceOperationHistory);
            UnitWork.Add(processTransitionHistoryEntity);
            UnitWork.Save();

            return true;
        }
        #endregion

        /// <summary>
        /// Ѱ�Ҹýڵ�ִ����
        /// </summary>
        /// <param name="wfruntime"></param>
        /// <returns></returns>
        private string GetMakerList(FlowRuntime wfruntime)
        {
            string makerList = "";
            if (wfruntime.runtimeModel.nextNodeId == "-1")
            {
                throw (new Exception("�޷�Ѱ�ҵ���һ���ڵ�"));
            }
            if (wfruntime.runtimeModel.nextNodeType == 0)//����ǻ�ǩ�ڵ�
            {
                List<string> _nodelist = wfruntime.GetCountersigningNodeIdList(wfruntime.runtimeModel.nextNodeId);
                string _makerList = "";
                foreach (string item in _nodelist)
                {
                    _makerList = GetMakerList(wfruntime.runtimeModel.nodes[item], wfruntime.runtimeModel.flowInstanceId);
                    if (_makerList == "-1")
                    {
                        throw (new Exception("�޷�Ѱ�ҵ���ǩ�ڵ�������,��鿴��������Ƿ�������!"));
                    }
                    if (_makerList == "1")
                    {
                        throw (new Exception("��ǩ�ڵ������߲���Ϊ������,��鿴��������Ƿ�������!"));
                    }
                    if (makerList != "")
                    {
                        makerList += ",";
                    }
                    makerList += _makerList;
                }
            }
            else
            {
                makerList = GetMakerList(wfruntime.runtimeModel.nextNode, wfruntime.runtimeModel.flowInstanceId);
                if (makerList == "-1")
                {
                    throw (new Exception("�޷�Ѱ�ҵ��ڵ�������,��鿴��������Ƿ�������!"));
                }
            }

            return makerList;
        }
        /// <summary>
        /// Ѱ�Ҹýڵ�ִ����
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private string GetMakerList(FlowNode node, string processId)
        {
            try
            {
                string makerlsit = "";

                if (node.setInfo == null)
                {
                    makerlsit = "-1";
                }
                else
                {
                    //if (node.setInfo.NodeDesignate.Value == "NodeDesignateType1")//���г�Ա
                    //{
                    //    makerlsit = "1";
                    //}
                    //else if (node.setInfo.NodeDesignate.Value == "NodeDesignateType2")//ָ����Ա
                    //{
                    makerlsit = GenericHelpers.ArrayToString(node.setInfo.NodeDesignateData.role, makerlsit);
                    // makerlsit = ArrwyToString(node.setInfo.NodeDesignateData.post, makerlsit);
                    //   makerlsit = ArrwyToString(node.setInfo.NodeDesignateData.usergroup, makerlsit);
                    makerlsit = GenericHelpers.ArrayToString(node.setInfo.NodeDesignateData.users, makerlsit);

                    if (makerlsit == "")
                    {
                        makerlsit = "-1";
                    }
                    // }
                    //else if (node.setInfo.NodeDesignate.Value == "NodeDesignateType3")//�������쵼
                    //{
                    //    UserEntity userEntity = userService.GetEntity(OperatorProvider.Provider.Current().UserId);
                    //    if (string.IsNullOrEmpty(userEntity.ManagerId))
                    //    {
                    //        makerlsit = "-1";
                    //    }
                    //    else
                    //    {
                    //        makerlsit = userEntity.ManagerId;
                    //    }
                    //}
                    //else if (node.setInfo.NodeDesignate.Value == "NodeDesignateType4")//ǰһ�����쵼
                    //{
                    //    FlowInstanceTransitionHistory transitionHistoryEntity = FlowInstanceTransitionHistoryService.GetEntity(flowInstanceId, node.id.Value);
                    //    UserEntity userEntity = userService.GetEntity(transitionHistoryEntity.CreateUserId);
                    //    if (string.IsNullOrEmpty(userEntity.ManagerId))
                    //    {
                    //        makerlsit = "-1";
                    //    }
                    //    else
                    //    {
                    //        makerlsit = userEntity.ManagerId;
                    //    }
                    //}
                    //else if (node.setInfo.NodeDesignate.Value == "NodeDesignateType5")//�����߲����쵼
                    //{
                    //    UserEntity userEntity = userService.GetEntity(OperatorProvider.Provider.Current().UserId);
                    //    DepartmentEntity departmentEntity = departmentService.GetEntity(userEntity.DepartmentId);

                    //    if (string.IsNullOrEmpty(departmentEntity.ManagerId))
                    //    {
                    //        makerlsit = "-1";
                    //    }
                    //    else
                    //    {
                    //        makerlsit = departmentEntity.ManagerId;
                    //    }
                    //}
                    //else if (node.setInfo.NodeDesignate.Value == "NodeDesignateType6")//�����߹�˾�쵼
                    //{
                    //    UserEntity userEntity = userService.GetEntity(OperatorProvider.Provider.Current().UserId);
                    //    OrganizeEntity organizeEntity = organizeService.GetEntity(userEntity.OrganizeId);

                    //    if (string.IsNullOrEmpty(organizeEntity.ManagerId))
                    //    {
                    //        makerlsit = "-1";
                    //    }
                    //    else
                    //    {
                    //        makerlsit = organizeEntity.ManagerId;
                    //    }
                    //}
                }
                return makerlsit;
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// ������ת���ɶ���������ִ�
        /// </summary>
        /// <param name="data"></param>
        /// <param name="Str"></param>
        /// <returns></returns>
       
        /// <summary>
        /// �������
        /// <para>������2017-01-20 15:44:45</para>
        /// </summary>
        public void Verification(VerificationReq request)
        {
            //����
            if (request.VerificationFinally == "3")
            {
                string _nodeId = "";
                if (!string.IsNullOrEmpty(request.NodeRejectStep))
                {
                    _nodeId = request.NodeRejectStep;
                }
                NodeReject(request.FlowInstanceId, _nodeId, request.VerificationOpinion);
            }
            else if (request.VerificationFinally == "2")//��ʾ��ͬ��
            {
                NodeVerification(request.FlowInstanceId, false, request.VerificationOpinion);
            }
            else if (request.VerificationFinally == "1")//��ʾͬ��
            {
                NodeVerification(request.FlowInstanceId, true, request.VerificationOpinion);
            }
        }

        public void Update(FlowInstance flowScheme)
        {
            Repository.Update(u => u.Id == flowScheme.Id, u => new FlowInstance());
        }

        public TableData Load(QueryFlowInstanceListReq request)
        {
            //todo:����/�Ѱ�/�ҵ�
            var result = new TableData();

            result.count = UnitWork.Find<FlowInstance>(u => u.CreateUserId == request.userid).Count();
            if (request.type == "inbox")   //��������
            {
                result.data = UnitWork.Find<FlowInstance>(request.page, request.limit, "CreateDate descending", null).ToList();

            }
            else if (request.type == "outbox")  //�Ѱ�����
            {
                result.data = UnitWork.Find<FlowInstance>(request.page, request.limit, "CreateDate descending", null).ToList();

            }
            else  //�ҵ�����
            {
                result.data = UnitWork.Find<FlowInstance>(request.page, request.limit, "CreateDate descending", null).ToList();
            }

            return result;
        }
    }
}
