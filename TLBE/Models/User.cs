using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLBE.Models
{
    public class User
    {
        public int Id { get; set; }
        public string FirebaseUserId { get; set; }

        public string Username { get; set; }

        public string Email { get; set; }

        public List<Collection> Collections { get; set; }
    }
}
