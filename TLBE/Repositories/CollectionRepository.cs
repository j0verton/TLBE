using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Data;
using TLBE.Models;

namespace TLBE.Repositories
{
    public class CollectionRepository
    {
        private readonly ApplicationDbContext _context;
        public CollectionRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<Collection> GetCollectionsByUserId(int id)
        {
            return _context.Collection
                .Include(c => c.Tunes)
                .Where(c=> c.UserId ==id)
                .ToList();
        }

        //getcustomcollectionsbyuser
        //addCustomCOllection
        //saveCOllection
        //delete collection - maybe dont do this just pull collections where Tunes > 0

        //

    }
}
