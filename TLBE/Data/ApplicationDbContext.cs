using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Models;

namespace TLBE.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }
        public DbSet<Tune> Tune { get; set; }
        public DbSet<UserProfile> User { get; set; }
        public DbSet<Collection> Collection { get; set; }
    }
}
