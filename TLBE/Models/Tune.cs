using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLBE.Models
{
    public class Tune
    {
        public int Id { get; set; }
        public int UserProfileId { get; set; }
        public string Name { get; set; }
        public string Key { get; set; }
        public string Tuning { get; set; }
        public string Source { get; set; }

        public string Notes { get; set; }

        public string Link { get; set; }

        public bool Starred { get; set; }

        //fix db then uncomment
        public bool? Learning { get; set; }
        public string AudioUpload { get; set; }

    }
}
