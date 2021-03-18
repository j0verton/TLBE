using System.Collections.Generic;
using TLBE.Models;

namespace TLBE.Repositories
{
    public interface IUserProfileRepository
    {
        void Add(User user);
        User GetByFirebaseUserId(string firebaseUserId);
        User GetUserProfileById(int id);
        List<User> GetUserProfiles();
        void Update(User user);
    }
}