using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GunPermAnalysis.Controllers
{
    public class PersonsController : Controller
    {
        // GET: Persons
        public ActionResult Index()
        {
            List<Persons> persons = new List<Persons>();
            persons.Add(new Persons() { Id = 1, FirstName = "Jacek", Surname = "K", City = "Lodz", AgeGroupId = 1, JobId = 1, Gender = "Male" });
            persons.Add(new Persons() { Id = 1, FirstName = "Pawel", Surname = "K", City = "Lodz", AgeGroupId = 1, JobId = 1, Gender = "Male" });
            persons.Add(new Persons() { Id = 1, FirstName = "Gawel", Surname = "K", City = "Lodz", AgeGroupId = 1, JobId = 1, Gender = "Male" });
            persons.Add(new Persons() { Id = 1, FirstName = "Piotr", Surname = "K", City = "Lodz", AgeGroupId = 1, JobId = 1, Gender = "Male" });

            return View(persons);
        }
    }
}