using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Menuwrap.Models;
using System.Net.Mail;
using System.Configuration;
using DataAccessLayer;

namespace Menuwrap.Controllers
{
    public class AccountController : BaseController
    {
        public AccountController()
        {
        }

        [HttpPost]
        public JsonResult TryRegisterUser(RegisterViewModel userObj)
        {
            var tempUser = new user()
            {
                Email_Id = userObj.email,
                Isactive = true,
                Password = userObj.id,
                Username = userObj.name,
                addr = string.Format("gender:{0},locale:{3},timezone:{4}", userObj.gender, userObj.id, userObj.link, userObj.locale, userObj.timezone, userObj.verified),
                Role_Id =2,
                Contact = string.Empty
            };
            tempUser = buisnessLogic.TryRegisterUser(tempUser);
            userObj.userID = tempUser.UserId;
            userObj.contact = tempUser.Contact;
            return Json(userObj);
        }

        [HttpPost]
        public bool UpdateContact(RegisterViewModel userObj)
        {
            var tempUser = new user()
            {
                 UserId = userObj.userID,
                 Contact = userObj.contact
            };
            return buisnessLogic.UpdateContact(tempUser);
        }
    }
}