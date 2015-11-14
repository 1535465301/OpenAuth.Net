using System.Collections.Generic;
using System.Linq;

namespace OpenAuth.Domain.Interface
{
    public interface IUserRepository :IRepository<User>
    {
        IEnumerable<User> LoadUsers();

        IEnumerable<User> LoadInOrgs(params int[] orgId);
        int GetUserCntInOrgs(params int[] orgIds);
        IEnumerable<User> LoadInOrgs(int pageindex, int pagesize, params int[] orgIds);

        void SetOrg(int userId, params int[] orgIds);

        /// <summary>
        /// ɾ���û�������û���ص���Ϣ
        /// </summary>
        void Delete(int id);

    }
}