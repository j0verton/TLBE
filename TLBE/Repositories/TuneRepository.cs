using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
        public List<Tune> GetTunesByUserId()
        { 
        
        }
        //get tunes by user (id)?

        //add tune 

        //add tune collection
    }
}
