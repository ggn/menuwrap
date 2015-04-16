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
        List<SearchResult> GetRestaurantResult(int restID, int categoryID);
        List<Category> getCategories();
        List<Restaurant> GetRestaurants(int? id);
        bool InsertRestraunt(Restaurant res);
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
            if (string.IsNullOrEmpty(p))
            {
                return menuwrapEntities.Cities;
            }
            return menuwrapEntities.Cities.Where(x => x.City_name.Contains(p));
        }

        public IQueryable<Location> get_location(string p, int city_id)
        {
            if (string.IsNullOrEmpty(p)) {
                return menuwrapEntities.Locations.Where(x => x.city_Id == city_id);
            }
            return menuwrapEntities.Locations.Where(x => x.Location_name.Contains(p) && x.city_Id == city_id);
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
                   Price = x.res_map_detail.res_map.Cost,
                 CategoryId = categoryID
            }).ToList();

            return b;
        }

        public List<SearchResult> GetRestaurantResult(int restID, int categoryID)
        {
            var a = menuwrapEntities.Restaurants.Where(x => x.Resturant_Id == restID)
                .Join(menuwrapEntities.Res_food_map,
                rest => rest.Resturant_Id,
                resFood => resFood.Resturant_Id,
                (rest, resFood) => new { rest = rest, restFoodMap = resFood })
                .Join(menuwrapEntities.FoodItems,
                resFoodMap => resFoodMap.restFoodMap.Item_Id,
                food => food.Item_Id,
                (resFoodMap, food) => new { resFoodMap = resFoodMap, food = food })
                .Join(menuwrapEntities.Cat_food_map,
                resFoods => resFoods.food.Item_Id,
                foodCatMAp => foodCatMAp.Item_Id,
                (resFoods, foodCatMAp) => new { resFoods = resFoods, foodCatMAp = foodCatMAp });

            var temp = a.Where(x => x.foodCatMAp.Category_Id == categoryID);

            var b = temp.Select(x=> new SearchResult() { 
                 RestaurantName = x.resFoods.resFoodMap.rest.Restaurant_name,
                 RestaurantId = x.resFoods.resFoodMap.rest.Resturant_Id,
                 FoodId = x.resFoods.food.Item_Id,
                 FoodName = x.resFoods.food.Item_name,
                 Price = x.resFoods.resFoodMap.restFoodMap.Cost,
                  //Landmark = x.resFoods.resFoodMap.rest.Landmark,
                  RestDesc = x.resFoods.resFoodMap.rest.Rest_Desc
            }).ToList() ;
                
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

        public List<Restaurant> GetRestaurants(int? id)
        {
            List<Restaurant> res;
            if (id.HasValue)
            {
                res = menuwrapEntities.Restaurants.Where(x => x.Resturant_Id == id.Value).ToList();
            }
            else {
                res = menuwrapEntities.Restaurants.ToList();
            }
            return res;
        }

        public bool InsertRestraunt(Restaurant res)
        {
            try
            {
                menuwrapEntities.Restaurants.Add(res);
                menuwrapEntities.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
