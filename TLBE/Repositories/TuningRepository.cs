using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLBE.Data;
using TLBE.Models;

namespace TLBE.Repositories
{
    public class TuningRepository : ITuningRepository
    {
        private readonly ApplicationDbContext _context;
        public TuningRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public List<Tuning> GetTunings()
        {
            return _context.Tuning
                    .ToList();
        }

        public void AddTuning(Tuning tuning)
        {
            _context.Add(tuning);
            _context.SaveChanges();
        }
    }
}
