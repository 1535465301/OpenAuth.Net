using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using OpenAuth.App.Extention;
using OpenAuth.App.Request;
using OpenAuth.App.Response;
using OpenAuth.App.SSO;
using OpenAuth.Repository.Domain;

namespace OpenAuth.App
{
    /// <summary>
    /// ������ʵ�������
    /// </summary>
    public class FlowInstanceApp :BaseApp<FlowInstance>
    {

        #region ��ȡ����
        /// <summary>
        /// ��ȡʵ��������Ϣʵ��
        /// </summary>
        /// <param name="keyVlaue">The key vlaue.</param>
        /// <returns>FlowInstance.</returns>
        public FlowInstance GetEntity(string keyVlaue)
        {
            try
            {
                return UnitWork.FindSingle<FlowInstance>(u =>u.Id == keyVlaue);
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region �ύ����
        /// <summary>
        /// �洢������ʵ������(�༭�ݸ���)
        /// </summary>
        /// <param name="processInstanceEntity"></param>
        /// <param name="processSchemeEntity"></param>
        /// <param name="wfOperationHistoryEntity"></param>
        /// <returns></returns>
        public int SaveProcess(string processId, FlowInstance processInstanceEntity, FlowInstanceScheme processSchemeEntity, FlowInstanceOperationHistory wfOperationHistoryEntity = null)
        {
            try
            {
                if (string.Empty ==(processInstanceEntity.Id))
                {
                    UnitWork.Add(processSchemeEntity);

                    processInstanceEntity.Id = processId;
                    processInstanceEntity.InstanceSchemeId = processSchemeEntity.Id;
                    UnitWork.Add(processInstanceEntity);
                }
                else
                {
                    processInstanceEntity.Id = (processId);
                    UnitWork.Update(processInstanceEntity);

                    processSchemeEntity.Id=(processInstanceEntity.InstanceSchemeId);
                    UnitWork.Update(processSchemeEntity);
                }
                if (wfOperationHistoryEntity != null)
                {
                    wfOperationHistoryEntity.InstanceId = processId;
                    UnitWork.Add(wfOperationHistoryEntity);
                }
                UnitWork.Save();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// �洢������ʵ������(����ʵ������)
        /// </summary>
        /// <param name="wfRuntimeModel"></param>
        /// <param name="processInstanceEntity"></param>
        /// <param name="processSchemeEntity"></param>
        /// <param name="processOperationHistoryEntity"></param>
        /// <param name="delegateRecordEntity"></param>
        /// <returns></returns>
        public int SaveProcess(WF_RuntimeModel wfRuntimeModel, FlowInstance processInstanceEntity, FlowInstanceScheme processSchemeEntity, FlowInstanceOperationHistory processOperationHistoryEntity, FlowInstanceTransitionHistory processTransitionHistoryEntity)
        {
            try
            {
                if (string.Empty == (processInstanceEntity.Id))
                {
                    UnitWork.Add(processSchemeEntity);

                    processInstanceEntity.Id = (string)(wfRuntimeModel.processId);
                    processInstanceEntity.InstanceSchemeId = processSchemeEntity.Id;
                    UnitWork.Add(processInstanceEntity);
                }
                else
                {
                    processInstanceEntity.Id =(processInstanceEntity.Id);
                    UnitWork.Update(processSchemeEntity);
                    UnitWork.Update(processInstanceEntity);
                }
                processOperationHistoryEntity.InstanceId = processInstanceEntity.Id;
                UnitWork.Add(processOperationHistoryEntity);

                if (processTransitionHistoryEntity != null)
                {
                    processTransitionHistoryEntity.InstanceId = processInstanceEntity.Id;
                    UnitWork.Add(processTransitionHistoryEntity);
                }
              
                UnitWork.Save();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// �洢������ʵ�����̣���˲��������ύ��
        /// </summary>
        /// <param name="processInstanceEntity"></param>
        /// <param name="processSchemeEntity"></param>
        /// <param name="processOperationHistoryEntity"></param>
        /// <param name="processTransitionHistoryEntity"></param>
        /// <returns></returns>
        public int SaveProcess(FlowInstance processInstanceEntity, FlowInstanceScheme processSchemeEntity, 
            FlowInstanceOperationHistory processOperationHistoryEntity,  FlowInstanceTransitionHistory processTransitionHistoryEntity = null)
        {
            try
            {
                processInstanceEntity.Id=(processInstanceEntity.Id);
                UnitWork.Update(processSchemeEntity);
                UnitWork.Update(processInstanceEntity);

                processOperationHistoryEntity.InstanceId = processInstanceEntity.Id;
                UnitWork.Add(processOperationHistoryEntity);

                if (processTransitionHistoryEntity != null)
                {
                    processTransitionHistoryEntity.InstanceId = processInstanceEntity.Id;
                    UnitWork.Add(processTransitionHistoryEntity);
                }
               
                UnitWork.Save();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        ///  ��������ʵ�� ��˽ڵ���
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="dbbaseId"></param>
        /// <param name="processInstanceEntity"></param>
        /// <param name="processSchemeEntity"></param>
        /// <param name="processOperationHistoryEntity"></param>
        /// <param name="delegateRecordEntityList"></param>
        /// <param name="processTransitionHistoryEntity"></param>
        /// <returns></returns>
        public int SaveProcess(string sql,string dbbaseId, FlowInstance processInstanceEntity, FlowInstanceScheme processSchemeEntity, FlowInstanceOperationHistory processOperationHistoryEntity, FlowInstanceTransitionHistory processTransitionHistoryEntity = null)
        {
            try
            {
                processInstanceEntity.Id=(processInstanceEntity.Id);
                UnitWork.Update(processSchemeEntity);
                UnitWork.Update(processInstanceEntity);

                processOperationHistoryEntity.InstanceId = processInstanceEntity.Id;
                UnitWork.Add(processOperationHistoryEntity);

                if (processTransitionHistoryEntity != null)
                {
                    processTransitionHistoryEntity.InstanceId = processInstanceEntity.Id;
                    UnitWork.Add(processTransitionHistoryEntity);
                }
               
                //if (!string.IsNullOrEmpty(dbbaseId) && !string.IsNullOrEmpty(sql))//���Ի���������ִ��sql���
                //{
                //    DataBaseLinkEntity dataBaseLinkEntity = dataBaseLinkService.GetEntity(dbbaseId);//��ȡ
                //    this.BaseRepository(dataBaseLinkEntity.DbConnection).ExecuteBySql(sql.Replace("{0}", processInstanceEntity.Id));
                //}
                UnitWork.Save();
                return 1;
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// ɾ��������ʵ������(ɾ���ݸ�ʹ��)
        /// </summary>
        /// <param name="keyValue">����</param>
        /// <returns></returns>
        public int DeleteProcess(string keyValue)
        {
            try
            {
                FlowInstance entity = UnitWork.FindSingle<FlowInstance>(u =>u.Id ==keyValue);

                UnitWork.Delete<FlowInstance>(u =>u.Id == keyValue);
                UnitWork.Delete<FlowInstanceScheme>(u =>u.Id == entity.InstanceSchemeId);
                UnitWork.Save();
                return 1;
            }
            catch {
                throw;
            }
        }
        /// <summary>
        /// �������ʵ��
        /// </summary>
        /// <param name="keyValue"></param>
        /// <param name="state">0��ͣ,1����,2ȡ�����ٻأ�</param>
        /// <returns></returns>
        public int OperateVirtualProcess(string keyValue,int state)
        {
            try
            {
                FlowInstance entity = UnitWork.FindSingle<FlowInstance>(u =>u.Id ==keyValue);
                if (entity.IsFinish == 1)
                {
                    throw new Exception("ʵ���Ѿ�������,����ʧ��");
                }
                else if (entity.IsFinish == 2)
                {
                    throw new Exception("ʵ���Ѿ�ȡ��,����ʧ��");
                }
                /// �����Ƿ����(0������,1���н���,2���ٻ�,3��ͬ��,4��ʾ������)
                string content = "";
                switch (state)
                {
                    case 0:
                        if (entity.Disabled == 0)
                        {
                            return 1;
                        }
                        entity.Disabled = 0;
                        content = "����ͣ����ͣ��һ�����̽��̡�" + entity.Code + "/" + entity.CustomName + "��";
                        break;
                    case 1:
                        if (entity.Disabled == 1)
                        {
                            return 1;
                        }
                        entity.Disabled = 1;
                        content = "�����á�������һ�����̽��̡�" + entity.Code + "/" + entity.CustomName + "��";
                        break;
                    case 2:
                        entity.IsFinish = 2;
                        content = "���ٻء��ٻ���һ�����̽��̡�" + entity.Code + "/" + entity.CustomName + "��";
                        break;
                }
                UnitWork.Update(entity);
                FlowInstanceOperationHistory processOperationHistoryEntity = new FlowInstanceOperationHistory();
                processOperationHistoryEntity.InstanceId = entity.Id;
                processOperationHistoryEntity.Content = content;
                UnitWork.Add(processOperationHistoryEntity);
                UnitWork.Save();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// ����ָ��
        /// </summary>
        /// <param name="processId"></param>
        /// <param name="makeLists"></param>
        public void DesignateProcess(string processId, string makeLists)
        {
            try
            {
                FlowInstance entity = new FlowInstance();
                entity.Id = processId;
                entity.MakerList = makeLists;
                UnitWork.Update(entity);
            }
            catch {
                throw;
            }
        }
        #endregion

        
        #region ���̴���API
        /// <summary>
        /// ����һ��ʵ��
        /// </summary>
        /// <param name="processId">����GUID</param>
        /// <param name="schemeInfoId">ģ����ϢID</param>
        /// <param name="wfLevel"></param>
        /// <param name="code">���̱��</param>
        /// <param name="customName">�Զ�������</param>
        /// <param name="description">��ע</param>
        /// <param name="frmData">��������Ϣ</param>
        /// <returns></returns>
        public bool CreateInstance(string processId, string schemeInfoId, FlowInstance FlowInstance, string frmData = null)
        {

            try
            {
                FlowScheme FlowScheme = UnitWork.FindSingle<FlowScheme>(u => u.Id == schemeInfoId);
                FlowSchemeDetail FlowSchemeDetail = UnitWork.FindSingle<FlowSchemeDetail>(u =>
                u.SchemeId == schemeInfoId && u.SchemeVersion == FlowScheme.SchemeVersion);

                WF_RuntimeInitModel wfRuntimeInitModel = new WF_RuntimeInitModel()
                {
                    schemeContent = FlowSchemeDetail.SchemeContent,
                    currentNodeId = "",
                    frmData = frmData,
                    processId = processId
                };
                IWF_Runtime wfruntime = null;

                if (frmData == null)
                {
                    throw new Exception("�Զ������Ҫ�ύ������");
                }
                else
                {
                    wfruntime = new WF_Runtime(wfRuntimeInitModel);
                }


                var user = AuthUtil.GetCurrentUser();
                #region ʵ����Ϣ
                FlowInstance.ActivityId = wfruntime.runtimeModel.nextNodeId;
                FlowInstance.ActivityType = wfruntime.GetStatus();//-1�޷�����,0��ǩ��ʼ,1��ǩ����,2һ��ڵ�,4�������н���
                FlowInstance.ActivityName = wfruntime.runtimeModel.nextNode.name;
                FlowInstance.PreviousId = wfruntime.runtimeModel.currentNodeId;
                FlowInstance.SchemeType = FlowScheme.SchemeType;
                FlowInstance.FrmType = FlowScheme.FrmType;
                FlowInstance.Disabled = 0;//��ʽ����
                FlowInstance.CreateUserId = user.User.Id.ToString();
                FlowInstance.CreateUserName = user.User.Account;
                FlowInstance.MakerList = (wfruntime.GetStatus() != 4 ? GetMakerList(wfruntime) : "");//��ǰ�ڵ��ִ�е�����Ϣ
                FlowInstance.IsFinish = (wfruntime.GetStatus() == 4 ? 1 : 0);
                #endregion

                #region ʵ��ģ��
                var data = new
                {
                    SchemeContent = FlowSchemeDetail.SchemeContent,
                    frmData = frmData
                };
                FlowInstanceScheme FlowInstanceScheme = new FlowInstanceScheme
                {
                    SchemeId = schemeInfoId,
                    SchemeVersion = FlowScheme.SchemeVersion,
                    ProcessType = 1,//1��ʽ��0�ݸ�
                    SchemeContent = data.ToJson().ToString()
                };
                #endregion

                #region ���̲�����¼
                FlowInstanceOperationHistory processOperationHistoryEntity = new FlowInstanceOperationHistory();
                processOperationHistoryEntity.Content = "��������" + user.User.Name + "������һ�����̽��̡�" + FlowInstance.Code + "/" + FlowInstance.CustomName + "��";
                #endregion

                #region ��ת��¼
                FlowInstanceTransitionHistory processTransitionHistoryEntity = new FlowInstanceTransitionHistory();
                processTransitionHistoryEntity.FromNodeId = wfruntime.runtimeModel.currentNodeId;
                processTransitionHistoryEntity.FromNodeName = wfruntime.runtimeModel.currentNode.name.Value;
                processTransitionHistoryEntity.FromNodeType = wfruntime.runtimeModel.currentNodeType;
                processTransitionHistoryEntity.ToNodeId = wfruntime.runtimeModel.nextNodeId;
                processTransitionHistoryEntity.ToNodeName = wfruntime.runtimeModel.nextNode.name.Value;
                processTransitionHistoryEntity.ToNodeType = wfruntime.runtimeModel.nextNodeType;
                processTransitionHistoryEntity.TransitionSate = 0;
                processTransitionHistoryEntity.IsFinish = (processTransitionHistoryEntity.ToNodeType == 4 ? 1 : 0);
                #endregion

                #region ί�м�¼
                //List<WFDelegateRecord> delegateRecordEntitylist = GetDelegateRecordList(schemeInfoId, FlowInstance.Code, FlowInstance.CustomName, FlowInstance.MakerList);
                //FlowInstance.MakerList += delegateUserList;
                #endregion

                SaveProcess(wfruntime.runtimeModel, FlowInstance, FlowInstanceScheme, processOperationHistoryEntity, processTransitionHistoryEntity);

                return true;
            }
            catch
            {
                throw;
            }

        }

        /// <summary>
        /// �ڵ����
        /// </summary>
        /// <param name="processId"></param>
        /// <returns></returns>
        public bool NodeVerification(string processId, bool flag, string description = "")
        {
            bool _res = false;
            try
            {
                string _sqlstr = "", _dbbaseId = "";
                FlowInstance FlowInstance = GetEntity(processId);
                FlowInstanceScheme FlowInstanceScheme = UnitWork.FindSingle<FlowInstanceScheme>(u => u.Id == FlowInstance.InstanceSchemeId);
                FlowInstanceOperationHistory FlowInstanceOperationHistory = new FlowInstanceOperationHistory();//������¼
                FlowInstanceTransitionHistory processTransitionHistoryEntity = null;//��ת��¼

                dynamic schemeContentJson = FlowInstanceScheme.SchemeContent.ToJson();//��ȡ������ģ�����ݵ�json����;
                WF_RuntimeInitModel wfRuntimeInitModel = new WF_RuntimeInitModel()
                {
                    schemeContent = schemeContentJson.SchemeContent.Value,
                    currentNodeId = FlowInstance.ActivityId,
                    frmData = schemeContentJson.frmData.Value,
                    previousId = FlowInstance.PreviousId,
                    processId = processId
                };
                IWF_Runtime wfruntime = new WF_Runtime(wfRuntimeInitModel);


                #region ��ǩ
                if (FlowInstance.ActivityType == 0)//��ǩ
                {
                    wfruntime.MakeTagNode(wfruntime.runtimeModel.currentNodeId, 1, "");//��ǵ�ǰ�ڵ�ͨ��
                    ///Ѱ����Ҫ��˵Ľڵ�Id
                    string _VerificationNodeId = "";
                    List<string> _nodelist = wfruntime.GetCountersigningNodeIdList(wfruntime.runtimeModel.currentNodeId);
                    string _makerList = "";
                    foreach (string item in _nodelist)
                    {
                        _makerList = GetMakerList(wfruntime.runtimeModel.nodeDictionary[item], wfruntime.runtimeModel.processId);
                        if (_makerList != "-1")
                        {
                            var id = AuthUtil.GetCurrentUser().User.Id.ToString();
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
                            FlowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.nodeDictionary[_VerificationNodeId].name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "��ͬ��,��ע��" + description;
                        }
                        else
                        {
                            FlowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.nodeDictionary[_VerificationNodeId].name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "����ͬ��,��ע��" + description;
                        }

                        string _Confluenceres = wfruntime.NodeConfluence(_VerificationNodeId, flag, AuthUtil.GetCurrentUser().User.Id.ToString(), description);
                        var _data = new
                        {
                            SchemeContent = wfruntime.runtimeModel.schemeContentJson.ToString(),
                            frmData = wfruntime.runtimeModel.frmData
                        };
                        FlowInstanceScheme.SchemeContent = _data.ToJson().ToString();
                        switch (_Confluenceres)
                        {
                            case "-1"://��ͨ��
                                FlowInstance.IsFinish = 3;
                                break;
                            case "1"://�ȴ�
                                break;
                            default://ͨ��
                                FlowInstance.PreviousId = FlowInstance.ActivityId;
                                FlowInstance.ActivityId = wfruntime.runtimeModel.nextNodeId;
                                FlowInstance.ActivityType = wfruntime.runtimeModel.nextNodeType;//-1�޷�����,0��ǩ��ʼ,1��ǩ����,2һ��ڵ�,4�������н���
                                FlowInstance.ActivityName = wfruntime.runtimeModel.nextNode.name;
                                FlowInstance.IsFinish = (wfruntime.runtimeModel.nextNodeType == 4 ? 1 : 0);
                                FlowInstance.MakerList = (wfruntime.runtimeModel.nextNodeType == 4 ?"": GetMakerList(wfruntime) );//��ǰ�ڵ��ִ�е�����Ϣ

                                #region ��ת��¼
                                processTransitionHistoryEntity = new FlowInstanceTransitionHistory();
                                processTransitionHistoryEntity.FromNodeId = wfruntime.runtimeModel.currentNodeId;
                                processTransitionHistoryEntity.FromNodeName = wfruntime.runtimeModel.currentNode.name.Value;
                                processTransitionHistoryEntity.FromNodeType = wfruntime.runtimeModel.currentNodeType;
                                processTransitionHistoryEntity.ToNodeId = wfruntime.runtimeModel.nextNodeId;
                                processTransitionHistoryEntity.ToNodeName = wfruntime.runtimeModel.nextNode.name.Value;
                                processTransitionHistoryEntity.ToNodeType = wfruntime.runtimeModel.nextNodeType;
                                processTransitionHistoryEntity.TransitionSate = 0;
                                processTransitionHistoryEntity.IsFinish = (processTransitionHistoryEntity.ToNodeType == 4 ? 1 : 0);
                                #endregion



                                if (wfruntime.runtimeModel.currentNode.setInfo != null && wfruntime.runtimeModel.currentNode.setInfo.NodeSQL != null)
                                {
                                    _sqlstr = wfruntime.runtimeModel.currentNode.setInfo.NodeSQL.Value;
                                    _dbbaseId = wfruntime.runtimeModel.currentNode.setInfo.NodeDataBaseToSQL.Value;
                                }
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
                        wfruntime.MakeTagNode(wfruntime.runtimeModel.currentNodeId, 1, AuthUtil.GetCurrentUser().User.Id.ToString(), description);
                        FlowInstance.PreviousId = FlowInstance.ActivityId;
                        FlowInstance.ActivityId = wfruntime.runtimeModel.nextNodeId;
                        FlowInstance.ActivityType = wfruntime.runtimeModel.nextNodeType;//-1�޷�����,0��ǩ��ʼ,1��ǩ����,2һ��ڵ�,4�������н���
                        FlowInstance.ActivityName = wfruntime.runtimeModel.nextNode.name;
                        FlowInstance.MakerList = wfruntime.runtimeModel.nextNodeType == 4 ? "" : GetMakerList(wfruntime);//��ǰ�ڵ��ִ�е�����Ϣ
                        FlowInstance.IsFinish = (wfruntime.runtimeModel.nextNodeType == 4 ? 1 : 0);
                        #region ��ת��¼

                        processTransitionHistoryEntity = new FlowInstanceTransitionHistory
                        {
                            FromNodeId = wfruntime.runtimeModel.currentNodeId,
                            FromNodeName = wfruntime.runtimeModel.currentNode.name.Value,
                            FromNodeType = wfruntime.runtimeModel.currentNodeType,
                            ToNodeId = wfruntime.runtimeModel.nextNodeId,
                            ToNodeName = wfruntime.runtimeModel.nextNode.name.Value,
                            ToNodeType = wfruntime.runtimeModel.nextNodeType,
                            TransitionSate = 0
                        };
                        processTransitionHistoryEntity.IsFinish = (processTransitionHistoryEntity.ToNodeType == 4 ? 1 : 0);
                        #endregion



                        if (wfruntime.runtimeModel.currentNode.setInfo != null && wfruntime.runtimeModel.currentNode.setInfo.NodeSQL != null)
                        {
                            _sqlstr = wfruntime.runtimeModel.currentNode.setInfo.NodeSQL.Value;
                            _dbbaseId = wfruntime.runtimeModel.currentNode.setInfo.NodeDataBaseToSQL.Value;
                        }

                        FlowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.currentNode.name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "��ͬ��,��ע��" + description;
                    }
                    else
                    {
                        FlowInstance.IsFinish = 3; //��ʾ�ýڵ㲻ͬ��
                        wfruntime.MakeTagNode(wfruntime.runtimeModel.currentNodeId, -1, AuthUtil.GetUserName(), description);

                        FlowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.currentNode.name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "����ͬ��,��ע��" + description;
                    }
                    var data = new
                    {
                        SchemeContent = wfruntime.runtimeModel.schemeContentJson.ToString(),
                        frmData = wfruntime.runtimeModel.frmData 
                    };
                    FlowInstanceScheme.SchemeContent = data.ToJson();
                }
                #endregion 

                _res = true;
                SaveProcess(_sqlstr, _dbbaseId, FlowInstance, FlowInstanceScheme, FlowInstanceOperationHistory, processTransitionHistoryEntity);
                return _res;
            }
            catch
            {
                throw;
            }
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
            try
            {
                FlowInstance FlowInstance = GetEntity(processId);
                FlowInstanceScheme FlowInstanceScheme = UnitWork.FindSingle<FlowInstanceScheme>(u => u.Id == FlowInstance.InstanceSchemeId);
                FlowInstanceOperationHistory FlowInstanceOperationHistory = new FlowInstanceOperationHistory();
                FlowInstanceTransitionHistory processTransitionHistoryEntity = null;
                dynamic schemeContentJson = FlowInstanceScheme.SchemeContent.ToJson();//��ȡ������ģ�����ݵ�json����;
                WF_RuntimeInitModel wfRuntimeInitModel = new WF_RuntimeInitModel()
                {
                    schemeContent = schemeContentJson.SchemeContent.Value,
                    currentNodeId = FlowInstance.ActivityId,
                    frmData = schemeContentJson.frmData.Value,
                    previousId = FlowInstance.PreviousId,
                    processId = processId
                };
                IWF_Runtime wfruntime = new WF_Runtime(wfRuntimeInitModel);


                string resnode = "";
                if (nodeId == "")
                {
                    resnode = wfruntime.RejectNode();
                }
                else
                {
                    resnode = nodeId;
                }
                wfruntime.MakeTagNode(wfruntime.runtimeModel.currentNodeId, 0, AuthUtil.GetUserName(), description);
                FlowInstance.IsFinish = 4;//4��ʾ���أ���Ҫ�����������ύ����
                if (resnode != "")
                {
                    FlowInstance.PreviousId = FlowInstance.ActivityId;
                    FlowInstance.ActivityId = resnode;
                    FlowInstance.ActivityType = wfruntime.GetNodeStatus(resnode);//-1�޷�����,0��ǩ��ʼ,1��ǩ����,2һ��ڵ�,4�������н���
                    FlowInstance.ActivityName = wfruntime.runtimeModel.nodeDictionary[resnode].name;
                    FlowInstance.MakerList = GetMakerList(wfruntime.runtimeModel.nodeDictionary[resnode], FlowInstance.PreviousId);//��ǰ�ڵ��ִ�е�����Ϣ
                    #region ��ת��¼
                    processTransitionHistoryEntity = new FlowInstanceTransitionHistory();
                    processTransitionHistoryEntity.FromNodeId = wfruntime.runtimeModel.currentNodeId;
                    processTransitionHistoryEntity.FromNodeName = wfruntime.runtimeModel.currentNode.name.Value;
                    processTransitionHistoryEntity.FromNodeType = wfruntime.runtimeModel.currentNodeType;
                    processTransitionHistoryEntity.ToNodeId = wfruntime.runtimeModel.nextNodeId;
                    processTransitionHistoryEntity.ToNodeName = wfruntime.runtimeModel.nextNode.name.Value;
                    processTransitionHistoryEntity.ToNodeType = wfruntime.runtimeModel.nextNodeType;
                    processTransitionHistoryEntity.TransitionSate = 1;//
                    processTransitionHistoryEntity.IsFinish = (processTransitionHistoryEntity.ToNodeType == 4 ? 1 : 0);
                    #endregion
                }
                var data = new
                {
                    SchemeContent = wfruntime.runtimeModel.schemeContentJson.ToString(),
                    frmData = (FlowInstance.FrmType == 0 ? wfruntime.runtimeModel.frmData : null)
                };
                FlowInstanceScheme.SchemeContent = data.ToJson().ToString();
                FlowInstanceOperationHistory.Content = "��" + "todo name" + "����" + wfruntime.runtimeModel.currentNode.name + "����" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "������,��ע��" + description;

                SaveProcess(FlowInstance, FlowInstanceScheme, FlowInstanceOperationHistory, processTransitionHistoryEntity);
                return true;
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// �ٻ����̽���
        /// </summary>
        /// <param name="processId"></param>
        public void CallingBackProcess(string processId)
        {
            try
            {
                OperateVirtualProcess(processId, 2);
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// ��ֹһ��ʵ��(����ɾ��)
        /// </summary>
        /// <param name="processId"></param>
        /// <returns></returns>
        public void KillProcess(string processId)
        {
            try
            {
                UnitWork.Delete<FlowInstance>(u => u.Id == processId);
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// ��ȡĳ���ڵ㣨��������ܿ������ύ����Ȩ�ޣ�
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public string GetProcessSchemeContentByNodeId(string data, string nodeId)
        {
            try
            {
                List<dynamic> list = new List<dynamic>();
                dynamic schemeContentJson = data.ToJson();//��ȡ������ģ�����ݵ�json����;
                string schemeContent1 = schemeContentJson.SchemeContent.Value;
                dynamic schemeContentJson1 = schemeContent1.ToJson();
                string FrmContent = schemeContentJson1.Frm.FrmContent.Value;
                dynamic FrmContentJson = FrmContent.ToJson();

                foreach (var item in schemeContentJson1.Flow.nodes)
                {
                    if (item.id.Value == nodeId && item.setInfo != null)
                    {
                        foreach (var item1 in item.setInfo.frmPermissionInfo)
                        {
                            foreach (var item2 in FrmContentJson)
                            {
                                if (item2.control_field.Value == item1.fieldid.Value)
                                {
                                    if (item1.look.Value == true)
                                    {
                                        if (item1.down != null)
                                        {
                                            item2.down = item1.down.Value;
                                        }
                                        list.Add(item2);
                                    }
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }
                schemeContentJson1.Frm.FrmContent = list.ToJson().ToString();
                schemeContentJson.SchemeContent = schemeContentJson1.ToString();
                return schemeContentJson.ToString();
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// ��ȡĳ���ڵ㣨��������ܿ������ύ����Ȩ�ޣ�
        /// </summary>
        /// <param name="data"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string GetProcessSchemeContentByUserId(string data, string userId)
        {
            try
            {
                List<dynamic> list = new List<dynamic>();
                dynamic schemeContentJson = data.ToJson();//��ȡ������ģ�����ݵ�json����;
                string schemeContent1 = schemeContentJson.SchemeContent.Value;
                dynamic schemeContentJson1 = schemeContent1.ToJson();
                string FrmContent = schemeContentJson1.Frm.FrmContent.Value;
                dynamic FrmContentJson = FrmContent.ToJson();

                foreach (var item in schemeContentJson1.Flow.nodes)
                {
                    if (item.setInfo != null && item.setInfo.UserId != null && item.setInfo.UserId.Value == userId)
                    {
                        foreach (var item1 in item.setInfo.frmPermissionInfo)
                        {
                            foreach (var item2 in FrmContentJson)
                            {
                                if (item2.control_field.Value == item1.fieldid.Value)
                                {
                                    if (item1.look.Value == true)
                                    {
                                        if (item1.down != null)
                                        {
                                            item2.down = item1.down.Value;
                                        }
                                        list.Add(item2);
                                    }
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }
                schemeContentJson1.Frm.FrmContent = list.ToJson().ToString();
                schemeContentJson.SchemeContent = schemeContentJson1.ToString();
                return schemeContentJson.ToString();
            }
            catch
            {
                throw;
            }
        }
        #endregion

        /// <summary>
        /// Ѱ�Ҹýڵ�ִ����
        /// </summary>
        /// <param name="wfruntime"></param>
        /// <returns></returns>
        private string GetMakerList(IWF_Runtime wfruntime)
        {
            try
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
                        _makerList = GetMakerList(wfruntime.runtimeModel.nodeDictionary[item], wfruntime.runtimeModel.processId);
                        if (_makerList == "-1")
                        {
                            throw (new Exception("�޷�Ѱ�ҵ���ǩ�ڵ�������,��鿴��������Ƿ�������!"));
                        }
                        else if (_makerList == "1")
                        {
                            throw (new Exception("��ǩ�ڵ������߲���Ϊ������,��鿴��������Ƿ�������!"));
                        }
                        else
                        {
                            if (makerList != "")
                            {
                                makerList += ",";
                            }
                            makerList += _makerList;
                        }
                    }
                }
                else
                {
                    makerList = GetMakerList(wfruntime.runtimeModel.nextNode, wfruntime.runtimeModel.processId);
                    if (makerList == "-1")
                    {
                        throw (new Exception("�޷�Ѱ�ҵ��ڵ�������,��鿴��������Ƿ�������!"));
                    }
                }

                return makerList;
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// Ѱ�Ҹýڵ�ִ����
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private string GetMakerList(dynamic node, string processId)
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
                    if (node.setInfo.NodeDesignate.Value == "NodeDesignateType1")//���г�Ա
                    {
                        makerlsit = "1";
                    }
                    else if (node.setInfo.NodeDesignate.Value == "NodeDesignateType2")//ָ����Ա
                    {
                        makerlsit = ArrwyToString(node.setInfo.NodeDesignateData.role, makerlsit);
                        makerlsit = ArrwyToString(node.setInfo.NodeDesignateData.post, makerlsit);
                        makerlsit = ArrwyToString(node.setInfo.NodeDesignateData.usergroup, makerlsit);
                        makerlsit = ArrwyToString(node.setInfo.NodeDesignateData.user, makerlsit);

                        if (makerlsit == "")
                        {
                            makerlsit = "-1";
                        }
                    }
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
                    //    FlowInstanceTransitionHistory transitionHistoryEntity = FlowInstanceTransitionHistoryService.GetEntity(processId, node.id.Value);
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
        private string ArrwyToString(dynamic data, string Str)
        {
            string resStr = Str;
            foreach (var item in data)
            {
                if (resStr != "")
                {
                    resStr += ",";
                }
                resStr += item.Value;
            }
            return resStr;
        }

        public FlowInstanceScheme GetProcessSchemeEntity(string keyValue)
        {
            return UnitWork.FindSingle<FlowInstanceScheme>(u => u.Id == keyValue);
        }

        /// <summary>
        /// �Ѱ����̽��Ȳ鿴�����ݵ�ǰ�����˵�Ȩ�޲鿴������
        /// <para>������2017-01-20 15:35:13</para>
        /// </summary>
        /// <param name="keyValue">The key value.</param>
        /// <returns>FlowInstanceScheme.</returns>
        public FlowInstanceScheme GetProcessSchemeByUserId(string keyValue)
        {
            var entity = GetProcessSchemeEntity(keyValue);
            entity.SchemeContent = GetProcessSchemeContentByUserId(entity.SchemeContent, AuthUtil.GetCurrentUser().User.Id.ToString());
            return entity;
        }


        /// <summary>
        /// �Ѱ����̽��Ȳ鿴�����ݵ�ǰ�ڵ��Ȩ�޲鿴������
        /// <para>������2017-01-20 15:34:35</para>
        /// </summary>
        /// <param name="keyValue">The key value.</param>
        /// <param name="nodeId">The node identifier.</param>
        /// <returns>FlowInstanceScheme.</returns>
        public FlowInstanceScheme GetProcessSchemeEntityByNodeId(string keyValue, string nodeId)
        {
            var entity = GetProcessSchemeEntity(keyValue);
            entity.SchemeContent = GetProcessSchemeContentByNodeId(entity.SchemeContent, nodeId);
            return entity;
        }

        public FlowInstance GetProcessInstanceEntity(string keyValue)
        {
            return UnitWork.FindSingle<FlowInstance>(u => u.Id == keyValue);
        }

        /// <summary>
        /// �������
        /// <para>������2017-01-20 15:44:45</para>
        /// </summary>
        /// <param name="processId">The process identifier.</param>
        /// <param name="verificationData">The verification data.</param>
        public void VerificationProcess(string processId, string verificationData)
        {
            try
            {
                dynamic verificationDataJson = verificationData.ToJson();

                //����
                if (verificationDataJson.VerificationFinally.Value == "3")
                {
                    string _nodeId = "";
                    if (verificationDataJson.NodeRejectStep != null)
                    {
                        _nodeId = verificationDataJson.NodeRejectStep.Value;
                    }
                    NodeReject(processId, _nodeId, verificationDataJson.VerificationOpinion.Value);
                }
                else if (verificationDataJson.VerificationFinally.Value == "2")//��ʾ��ͬ��
                {
                    NodeVerification(processId, false, verificationDataJson.VerificationOpinion.Value);
                }
                else if (verificationDataJson.VerificationFinally.Value == "1")//��ʾͬ��
                {
                    NodeVerification(processId, true, verificationDataJson.VerificationOpinion.Value);
                }
            }
            catch
            {
                throw;
            }
        }


        public void Add(FlowInstance flowScheme)
        {
            Repository.Add(flowScheme);
        }

        public void Update(FlowInstance flowScheme)
        {
           Repository.Update(u => u.Id == flowScheme.Id, u => new FlowInstance
            {
                //todo:Ҫ�޸ĵ�
            });
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
