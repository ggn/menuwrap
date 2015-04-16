using DataAccessLayer;
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
        public List<Category> a = new List<Category>();

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            a.Add(new Category() { Category_Id = 1, Category_name = "starter" });
            if (!Request.IsAjaxRequest())
            {
                ViewBag.categories = new SelectList(a, "Category_Id", "Category_name");
            }
         }
    }
}