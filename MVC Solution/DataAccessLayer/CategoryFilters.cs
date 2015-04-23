using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class CategoryFilters
    {
        public int location_Id { get; set; }
        public int category_Id { get; set; }
        public int city_ID { get; set; }
        public int FilterId { get; set; }
        public int CusineId { get; set; }
        public int SubCusineId { get; set; }
        public bool? isVeg { get; set; }
        public int maxCost { get; set; }
        public List<Filter> filters { get; set; }
        public List<cuisine> cuisines { get; set; }
    }
}
