﻿using System;
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
        List<SearchResult> GetSearchResult(int locationID,int categoryID);
        List<Category> getCategories(string category);
        List<Category> getCategories();
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

        public List<SearchResult> GetSearchResult(int locationID,int categoryID)
        {
            return repository.GetSearchResult(locationID,categoryID);
        }

        public List<Category> getCategories(string category)
        {
            return repository.getCategories(category);
        }

        public List<Category> getCategories()
        {
            return repository.getCategories();
        }
    }
}