using OpenAuth.Domain.Interface;

namespace OpenAuth.Domain.Service
{
    /// <summary>
    ///  Ȩ�޷��乤���������Ƿ��ǿ������˺Ŵ���
    /// </summary>
    public class AuthoriseFactory
    {
          public IUnitWork _unitWork { get; set; }

        public AuthoriseService Create(string loginuser)
        {
            if (loginuser == "System")
            {
                return new SystemAuthService();
            }
            else
            {
                return  new AuthoriseService()
                {
                    _unitWork = _unitWork,
                    User = _unitWork.FindSingle<User>(u =>u.Account == loginuser)
                };
            }
        }
    }
}