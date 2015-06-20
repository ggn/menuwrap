using DataAccessLayer;
using Menuwrap.Models;
using System;
using System.Configuration;
using System.Web.Mvc;
using Menuwrap.Helper;

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
            userObj.ExpiresIn = DateTime.Now.AddDays(Convert.ToInt32(ConfigurationManager.AppSettings["TokenExpiryInDays"])).ToShortDateString();
            userObj.AccessToken = new AesCryptographer().EncryptText(string.Format("{0},{1},{2},{3}",userObj.userID,userObj.name,userObj.email,userObj.contact));
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