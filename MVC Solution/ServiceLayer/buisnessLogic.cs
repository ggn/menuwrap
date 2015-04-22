using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using Repository;

namespace ServiceLayer
{
    public interface IbuisnessLogic
    {
        user GetUser(int userID);
        List<City> get_city(string p);
        List<Location> get_location(string p, int city_id);
        List<SearchResult> GetSearchResult(CategoryFilters categoryFilter);
        List<SearchResult> GetRestaurantResult(int restID, int categoryID);
        List<Category> getCategories(string category);
        List<Category> getCategories();
        List<Restaurant> GetRestaurants(int? id);
        bool InsertRestraunt(Restaurant res);
        bool DeleteRestraunt(long resID);
        List<Filter> GetFilters(long categoryID);
    }

    public class buisnessLogic : IbuisnessLogic
    {
        IRepository repository;

        public buisnessLogic()
        {
            repository = new ModelRepository();
        }

        public user GetUser(int userID)
        {
            return repository.GetUser(userID);
        }
        public List<City> get_city(string p)
        {
             return repository.get_city(p).ToList();
        }
        
        public List<Location> get_location(string p, int city_id)
        {
            return repository.get_location(p, city_id).ToList();
        }

        public List<SearchResult> GetSearchResult(CategoryFilters categoryFilter)
        {
            return repository.GetSearchResult(categoryFilter);
        }

        public List<SearchResult> GetRestaurantResult(int restID, int categoryID)
        {
            return repository.GetRestaurantResult(restID, categoryID);
        }
        public List<Category> getCategories(string category)
        {
            return repository.getCategories(category);
        }

        public List<Category> getCategories()
        {
            return repository.getCategories();
        }

        public List<Restaurant> GetRestaurants(int? id)   {
            return repository.GetRestaurants(id);
        }

        public bool InsertRestraunt(Restaurant res) {
            return repository.InsertRestraunt(res);
        }

        public bool DeleteRestraunt(long resID) {
            return repository.DeleteRestraunt(resID);
        }

        public List<Filter> GetFilters(long categoryID)
        {
            return repository.GetFilters(categoryID);
        }
    }
}
