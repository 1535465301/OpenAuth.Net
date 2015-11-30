using OpenAuth.Domain.Interface;
using System;
using Infrastructure.Helper;
using OpenAuth.Domain;

namespace OpenAuth.App
{
    public class LoginApp
    {
        private IUserRepository _repository;

        public LoginApp(IUserRepository repository)
        {
            _repository = repository;
        }

        public void Login(string userName, string password)
        {
            var user = _repository.FindSingle(u => u.Account == userName);
            if (user == null)
            {
                throw new Exception("�û��ʺŲ�����");
            }

            user.CheckPassword(password);
            SessionHelper.AddSessionUser(user);
        }
    }
}