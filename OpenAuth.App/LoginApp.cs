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
        private IRepository<ModuleElement> _moduleElementRepository;
        private IResourceRepository _resourceRepository;

        public LoginApp(IUserRepository repository,
            IModuleRepository moduleRepository,
            IRelevanceRepository relevanceRepository,
            IRepository<ModuleElement>  moduleElementRepository,
            IResourceRepository resourceRepository)
        {
            _repository = repository;
            _moduleRepository = moduleRepository;
            _relevanceRepository = relevanceRepository;
            _moduleElementRepository = moduleElementRepository;
            _resourceRepository = resourceRepository;
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
            //�û���ɫ���Լ����䵽�Ĳ˵�ID
            var elementIds =
               _relevanceRepository.Find(
                   u =>
                       (u.FirstId == user.Id && u.Key == "UserElement") ||
                       (u.Key == "RoleElement" && userRoleIds.Contains(u.FirstId))).Select(u => u.SecondId).ToList();
            //�ó������û�ӵ�е�ģ��
            loginVM.Modules = _moduleRepository.Find(u => moduleIds.Contains(u.Id)).MapToList<ModuleView>();

            //ģ��˵�Ȩ��
            foreach (var module in loginVM.Modules)
            {
                module.Elements = _moduleElementRepository.Find(u => u.ModuleId == module.Id && elementIds.Contains( u.Id)).ToList();
            }

            //�û���ɫ���Լ����䵽����ԴID
            var resourceIds = _relevanceRepository.Find(
                    u =>
                        (u.FirstId == user.Id && u.Key == "UserResource") ||
                        (u.Key == "RoleResource" && userRoleIds.Contains(u.FirstId))).Select(u => u.SecondId).ToList();
            loginVM.Resources = _resourceRepository.Find(u => resourceIds.Contains(u.Id)).ToList();

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
            loginUser.Modules = _moduleRepository.Find(null).MapToList<ModuleView>();
            //ģ������Ĳ˵�
            foreach (var module in loginUser.Modules)
            {
                module.Elements = _moduleElementRepository.Find(u => u.ModuleId == module.Id).ToList();
            }

            loginUser.Resources = _resourceRepository.Find(null).ToList();
            return loginUser;
        }
    }
}