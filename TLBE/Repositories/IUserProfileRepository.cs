using System.Collections.Generic;
using TLBE.Models;

namespace TLBE.Repositories
{
    public interface IUserProfileRepository
    {
        void Add(UserProfile user);
        UserProfile GetByFirebaseUserId(string firebaseUserId);
        UserProfile GetUserProfileById(int id);
        List<UserProfile> GetUserProfiles();
        void Update(UserProfile user);
    }
}