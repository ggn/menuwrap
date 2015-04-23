using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccessLayer;
using ServiceLayer;
using System.Web.Helpers;
using System.Web.Script.Serialization;
using Menuwrap.Models;

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
        public ActionResult SearchFood(CategoryFilters categoryFilter)
        {
            var retList = buisnessLogic.GetSearchResult(categoryFilter);
            if (categoryFilter.maxCost>0)
            {
                return PartialView("_FilteredFoodResult", retList);
            }
            return PartialView("SearchResult",retList);
        }

        [HttpPost]
        public JsonResult GetFilter(long category_Id)
        {
            var retList = buisnessLogic.GetFilters(category_Id);
            var filterSelectLists = new FilterViewModel();
            filterSelectLists.Filters = new SelectList(retList.filters, "Filter_Id", "Filter_name");
            filterSelectLists.Cuisines = new SelectList(retList.cuisines, "Cuisine_Id", "cuisine_name");
            return Json(filterSelectLists, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetSubCuisines(long cuisineID)
        {
            var retList = buisnessLogic.GetSubCuisines(cuisineID);
            var cuisineSelectLists = new SelectList(retList, "Cuisine_Id", "cuisine_name");
            return Json(cuisineSelectLists, JsonRequestBehavior.AllowGet);
        }
    }
}