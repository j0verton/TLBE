using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Data;
using TLBE.Models;

namespace TLBE.Repositories
{
    public class UserProfileRepository : IUserProfileRepository
    {
        private readonly ApplicationDbContext _context;

        public UserProfileRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public List<UserProfile> GetUserProfiles()
        {
            return _context.User
                .OrderBy(up => up.Username)
                .ToList();
        }
        public UserProfile GetUserProfileById(int id)
        {
            return _context.User
                .FirstOrDefault(up => up.Id == id);
        }

        public UserProfile GetByFirebaseUserId(string firebaseUserId)
        {
            return _context.User
                .FirstOrDefault(u => u.FirebaseUserId == firebaseUserId);

        }

        public void Add(UserProfile user)
        {
            _context.Add(user);
            _context.SaveChanges();
        }
        public void Update(UserProfile user)
        {
            _context.Entry(user).State = EntityState.Modified;
            _context.SaveChanges();
        }
    }
}