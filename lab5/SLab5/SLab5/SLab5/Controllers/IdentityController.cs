using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SLab5.DTO;
using SLab5.Entity;
using SLab5.Services;

namespace SLab5.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class IdentityController
    {

        private readonly IIdentityService _identityService;

        public IdentityController(IIdentityService identityService)
        {
            _identityService = identityService;
        }

        [HttpPost("SignIn")]
        public async Task<User> SignIn(SignInDTO signInDto) => _identityService.SignIn(signInDto);
        
        [HttpPost("SignUp")]
        public async Task<User> SignUp(SignUpDTO signUpDto) => _identityService.SignUp(signUpDto);
    }
}