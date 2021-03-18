using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Data;
using TLBE.Models;

namespace TLBE.Repositories
{
    public class CollectionRepository : ICollectionRepository
    {
        private readonly ApplicationDbContext _context;
        public CollectionRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<Collection> GetCollectionsByUserId(int id)
        {
            try
            {
                return _context.Collection
                    .Include(c => c.Tunes)
                    .Where(c => c.UserId == id)
                    .ToList();
            }
            catch (Exception ex)
            {
                return new List<Collection>();
            }
        }

        public void saveCollection(Collection collection)
        {
            _context.Add(collection);
            _context.SaveChanges();

        }

        //getcustomcollectionsbyuser
        //addCustomCOllection
        //saveCOllection
        //delete collection - maybe dont do this just pull collections where Tunes > 0

        //

    }
}
