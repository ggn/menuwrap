using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MenuWrap.Controllers
{
    public class searchController : ApiController
    {
        [HttpGet]
        public string SearchMenu()
        {
            return "Done";
        }

    }
}
