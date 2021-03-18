using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLBE.Models
{
    public class TuneCollection
    {
        public int Id { get; set; }
        public int CollectionId { get; set; }
        public int TuneId { get; set; }
        public Tune Tune { get; }
    }
}
