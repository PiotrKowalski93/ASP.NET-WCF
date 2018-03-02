using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GunPermAnalysis.Controllers
{
    public class GunsController : Controller
    {
        // GET: Guns
        public ActionResult Index()
        {
            return View();
        }
    }
}