using SchoolSurvey.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace SchoolSurvey.Controllers
{
    public class HomeController : Controller
    {
        private SurveyModelEntities _context;

        public HomeController()
        {
            _context = new SurveyModelEntities();
        }

        public ActionResult Index()
        {
            return View(_context.Scholar);
        }

        public ActionResult Survey(int? scholarId)
        {
            ViewBag.Scholar = _context.Scholar.FirstOrDefault(scholar => scholar.Id == scholarId);
            ViewBag.DefaultAnswers = _context.Answer.Where(answer => answer.IsDefault);
            return View(_context.Category);
        }

        [HttpPost]
        public ActionResult Finish(List<ScholarAnswer> scholarAnswers)
        {
            var scholarId = scholarAnswers.FirstOrDefault().ScholarId;
            var oldAnswers = _context.ScholarAnswer.Where(scholarAnswer => scholarAnswer.ScholarId == scholarId);
            _context.ScholarAnswer.RemoveRange(oldAnswers);

            _context.ScholarAnswer.AddRange(scholarAnswers.Where(sch => sch.AnswerId != 0));
            _context.SaveChanges();

            return View();
        }

        public ActionResult Finish()
        {
            return View();
        }
    }
}