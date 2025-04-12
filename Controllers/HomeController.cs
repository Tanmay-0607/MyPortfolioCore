using Microsoft.AspNetCore.Mvc;

namespace SelfPortfolio.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewBag.Message = "My description page.";
            return View();
        }

        public IActionResult Contact()
        {
            ViewBag.Message = "My contact page.";
            return View();
        }

        public IActionResult Projects()
        {
            return View();
        }
    }
}