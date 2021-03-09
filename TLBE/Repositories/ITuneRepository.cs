using System.Collections.Generic;
using TLBE.Models;

namespace TLBE.Repositories
{
    public interface ITuneRepository
    {
        List<Tune> GetStarredTunesByUserId(int id);
        List<Tune> GetTunesByUserId(int id);
        void StarTune(int id);
        void UnstarTune(int id);
    }
}