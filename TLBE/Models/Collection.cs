using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLBE.Models
{
    public class Collection
    {
        public int Id { get; set; }
        public int UserProfileId { get; set; }
        public string Name { get; set; }
        public List<Tune> Tunes { get; set; }
    }
}
