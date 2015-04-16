using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class SearchResult
    {
        public int RestaurantId { get; set; }
        public string RestaurantName { get; set; }
        public int FoodId { get; set; }
        public string FoodName { get; set; }
        public int Price { get; set; }
    }
}
