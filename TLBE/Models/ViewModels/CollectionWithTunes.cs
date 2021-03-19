using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLBE.Models.ViewModels
{
    public class CollectionWithTunes
    {
        public CollectionWithTunes(Collection collection)
        {
            Collection = collection;
        }

        public Collection Collection { get; set; }
        public List<Tune> Tunes { get; set; }
    }
}
