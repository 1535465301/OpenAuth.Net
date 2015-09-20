using System;

namespace OpenAuth.Domain
{
    public partial class User
    {
        public string UserId { get; set; }
        public string Account { get; set; }
        public string Password { get; set; }
        public string RealName { get; set; }
        public string RoleId { get; set; }
        public bool Enabled { get; set; }
        public bool DeleteMark { get; set; }

        public void CheckLogin(string password)
        {
            if(this.Password != password)
                throw new Exception("�������");
            if(!this.Enabled)
                throw new Exception("�û��Ѿ���ͣ��");
            if (DeleteMark)
                throw new Exception("���˺��Ѿ���ɾ��");
        }
    }
}
