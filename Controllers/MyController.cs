using Microsoft.AspNetCore.Mvc;

namespace SelfPortfolio2.Controllers
{
    public class MyController : Controller
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public MyController(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public IActionResult GetUserName()
        {
            // Ensure HttpContext and User.Identity are not null before accessing Name
            var httpContext = _httpContextAccessor.HttpContext;
            if (httpContext?.User?.Identity?.Name != null)
            {
                return Ok(httpContext.User.Identity.Name);  // Return the name as a JSON response
            }

            // Return a 404 Not Found if the user name is not available
            return NotFound("User name not available.");
        }
    }
}