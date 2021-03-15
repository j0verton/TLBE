using System.Collections.Generic;
using TLBE.Models;

namespace TLBE.Repositories
{
    public interface IUserRepository
    {
        void Add(User user);
        User GetByFirebaseUserId(string firebaseUserId);
        User GetUserById(int id);
        List<User> GetUsers();
        void Update(User user);
    }
}