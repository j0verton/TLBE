using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Data;
using TLBE.Models;

namespace TLBE.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext _context;

        public UserRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public List<User> GetUsers()
        {
            return _context.User
                .OrderBy(up => up.Username)
                .ToList();
        }
        public User GetUserById(int id)
        {
            return _context.User
                .FirstOrDefault(up => up.Id == id);
        }

        public User GetByFirebaseUserId(string firebaseUserId)
        {
            return _context.User
                .FirstOrDefault(u => u.FirebaseUserId == firebaseUserId);

        }

        public void Add(User user)
        {
            _context.Add(user);
            _context.SaveChanges();
        }
        public void Update(User user)
        {
            _context.Entry(user).State = EntityState.Modified;
            _context.SaveChanges();
        }
    }
}