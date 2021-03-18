using System.Collections.Generic;
using TLBE.Models;

namespace TLBE.Repositories
{
    public interface ITuningRepository
    {
        void AddTuning(Tuning tuning);
        List<Tuning> GetTunings();
    }
}