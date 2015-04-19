using System;
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
    public class RestuarntInfoController : BaseController
    {
        // GET: RestuarntInfo
        [HttpPost]
        public ActionResult Index(int restID,int catId)
        {
            return PartialView("Index",buisnessLogic.GetRestaurantResult(restID, catId));
        }

    }
}