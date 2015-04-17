using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Menuwrap.Controllers
{
    public class RestrauntController : BaseController
    {
        // GET: Restraunt
        public ActionResult Index()
        {

            return View(buisnessLogic.GetRestaurants(null));
        }

        // GET: Restraunt/Details/5
        public ActionResult Details(int id)
        {
            var temp = buisnessLogic.GetRestaurants(id);
            return View(temp);
        }

        // GET: Restraunt/Create
        public ActionResult Create()
        {
            return View(new Restaurant());
        }

        // POST: Restraunt/Create
        [HttpPost]
        public ActionResult Create(Restaurant collection)
        {
            try
            {
                // TODO: Add insert logic here
                buisnessLogic.InsertRestraunt(collection);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(collection);
            }
        }

        // GET: Restraunt/Edit/5
        public ActionResult Edit(int id)
        {
            return View(buisnessLogic.GetRestaurants(id).FirstOrDefault());
        }

        // POST: Restraunt/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Restaurant collection)
        {
            try
            {
                buisnessLogic.InsertRestraunt(collection);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Restraunt/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Restraunt/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
