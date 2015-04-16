using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{

    public interface IRepository
    {
        user GetUser(int userID);
        IQueryable<City> get_city(string p);
        IQueryable<Location> get_location(string p, int city_id);
        List<SearchResult> GetSearchResult(int locationID, int categoryID);
        List<Category> getCategories(string category);
        List<Category> getCategories();
    }

    public class ModelRepository : IRepository
    {
        Entities menuwrapEntities;
        public ModelRepository()
        {
            menuwrapEntities = new Entities();
        }

        public user GetUser(int userID)
        {
            return menuwrapEntities.users.Where(x => x.UserId == userID).FirstOrDefault();
        }

        public user GetRoles(int RoleID)
        {
            return menuwrapEntities.users.Where(x => x.UserId == RoleID).FirstOrDefault();
        }

        public IQueryable<City> get_city(string p)
        {
            return menuwrapEntities.Cities.Where(x => x.City_name.Contains(p));
        }

        public IQueryable<Location> get_location(string p, int city_id)
        {
            return menuwrapEntities.Locations.Where(x => x.Location_name.Contains(p) && x.City_Id == city_id);
        }


        public List<SearchResult> GetSearchResult(int locationID,int categoryID)
        {
            var a = menuwrapEntities.Restaurants.Where(x => x.Location_Id == locationID)
                .Join(menuwrapEntities.Res_food_map,
                x => x.Resturant_Id,
                y => y.Resturant_Id,
                (x, y) => new { res = x, res_map = y })
                .Join(menuwrapEntities.FoodItems.Where(z=>z.Cat_food_map.Any(map=>map.Category_Id==categoryID)),
                res_map => res_map.res_map.Item_Id,
                food => food.Item_Id,
                (res_map, food) => new { res_map_detail = res_map, fooditem = food });

            var b = a.Select(x=> new SearchResult() { 
                 RestaurantId =x.res_map_detail.res.Resturant_Id,
                 FoodId = x.fooditem.Item_Id,
                  RestaurantName = x.res_map_detail.res.Restaurant_name,
                  FoodName = x.fooditem.Item_name,
                   Price = x.res_map_detail.res_map.Cost
            }).ToList();

            return b;
        }

        public List<Category> getCategories(string category)
        {
            return menuwrapEntities.Categories.Where(x => x.Category_name.Contains(category)).ToList();
        }

        public List<Category> getCategories()
        {
            return menuwrapEntities.Categories.ToList();
        }

    }
}
