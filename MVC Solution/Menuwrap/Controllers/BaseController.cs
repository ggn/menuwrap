using ServiceLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Menuwrap.Controllers
{
    public class BaseController : Controller
    {
        public IbuisnessLogic buisnessLogic = new buisnessLogic();
        
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (!Request.IsAjaxRequest())
            {
                ViewBag.categories = new SelectList(buisnessLogic.getCategories(), "Category_Id", "Category_name");
                ViewBag.cities = new SelectList(buisnessLogic.get_city(string.Empty), "City_Id", "City_name");
            }
         }
    }
}