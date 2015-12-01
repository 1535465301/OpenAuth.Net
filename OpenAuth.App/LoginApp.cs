using OpenAuth.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure;
using Infrastructure.Helper;
using OpenAuth.App.ViewModel;
using OpenAuth.Domain;

namespace OpenAuth.App
{
    public class LoginApp
    {
        private IUserRepository _repository;
        private IModuleRepository _moduleRepository;
        private IRelevanceRepository _relevanceRepository;

        public LoginApp(IUserRepository repository,
            IModuleRepository moduleRepository,
            IRelevanceRepository relevanceRepository)
        {
            _repository = repository;
            _moduleRepository = moduleRepository;
            _relevanceRepository = relevanceRepository;
        }

        public LoginUserVM Login(string userName, string password)
        {
            var user = _repository.FindSingle(u => u.Account == userName);
            if (user == null)
            {
                throw new Exception("�û��ʺŲ�����");
            }
            user.CheckPassword(password);

            var loginVM = new LoginUserVM
            {
                User = user
            };
            //�û���ɫ
            var userRoleIds =
                _relevanceRepository.Find(u => u.FirstId == user.Id && u.Key == "UserRole").Select(u => u.SecondId).ToList();

            //�û���ɫ���Լ����䵽��ģ��ID
            var moduleIds =
                _relevanceRepository.Find(
                    u =>
                        (u.FirstId == user.Id && u.Key == "UserModule") ||
                        (u.Key == "RoleModule" && userRoleIds.Contains(u.FirstId))).Select(u =>u.SecondId).ToList();
            //�ó������û�ӵ�е�ģ��
            loginVM.Modules = _moduleRepository.Find(u => moduleIds.Contains(u.Id)).ToList();
            
           return loginVM;
        }

        /// <summary>
        /// �����ߵ�½
        /// </summary>
        public LoginUserVM LoginByDev()
        {
            var loginUser = new LoginUserVM
            {
                User = new User
                {
                    Name = "�������˺�"
                }
            };
            loginUser.Modules = _moduleRepository.Find(null).ToList();
            return loginUser;
        }
    }
}