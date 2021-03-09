using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Data;
using TLBE.Models;

namespace TLBE.Repositories
{
    public class TuneRepository
    {

        private readonly ApplicationDbContext _context;
        public TuneRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<Tune> GetTunesByUserId(int id)
        {
            return _context.Tune
               .Where(t => t.UserId == id)
               .ToList();
        }

        public List<Tune> GetStarredTunesByUserId(int id)
        {
            return _context.Tune
           .Where(t => t.UserId == id)
           .Where(t => t.Starred ==true)
           .ToList();
        }

        public void StarTune(id)
        { 
        
        }
        //get tunes by user (id)?

        //add tune 

        //add tune collection
    }
}
