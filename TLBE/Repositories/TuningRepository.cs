using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLBE.Repositories
{
    public class TuningRepository
    {
        private readonly ApplicationDbContext _context;
        //gettunings
        public TuningRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public List<Tuning> GetTunings()
        {
            return _context.Tuning
                    .ToList();
        }
        //addTuning
    }
}
