﻿using System.Collections.Generic;
using TLBE.Models;

namespace TLBE.Repositories
{
    public interface ITuneRepository
    {
        Tune AddTune(Tune tune);
        void AddTuneCollection(TuneCollection tc);
        void EditTune(Tune tune);
        List<Tune> GetStarredTunesByUserId(int id);
        Tune GetTuneById(int id);
        List<Tune> GetTunesByUserId(int id);
        void StarTune(int id);
        void UnstarTune(int id);
    }
}