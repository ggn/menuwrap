﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccessLayer;
using ServiceLayer;
using System.Web.Helpers;
using System.Web.Script.Serialization;

namespace Menuwrap.Controllers
{
    public class HomeController : BaseController
    {
        
        public ActionResult Index()
        {
            var retList = new List<string>();
           //buisnessLogic.GetSearchResult(1,1);
            //var user = buisnessLogic.GetUser(1);
            //retList = r.get_city("M");
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public string SearchCity(string q) 
        {
            var retList = buisnessLogic.get_city(q).Select(x=>new {id=x.City_Id,name=x.City_name });
            var serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(retList);
            return json;
        }

        public string SearchLocation(int cityID,string areaID)
        {
            var retList = buisnessLogic.get_location(areaID, cityID).Select(x => new { id = x.Location_Id, name = x.Location_name });
            var serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(retList);
            return json;
        }

        public string foodCategory()
        {
            var retList = buisnessLogic.getCategories().Select(x => new { id = x.Category_Id, name = x.Category_name });
            var serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(retList);
            return json;
        }

        [HttpPost]
        public ActionResult SearchFood(int location_Id,int category_Id)
        {
            var retList = buisnessLogic.GetSearchResult(location_Id,category_Id);
            return View("SearchResult",retList);
        }

        
    }
}