using System.Linq;
using Microsoft.AspNetCore.Http;
using SLab5.DTO;
using SLab5.Entity;
using SLab5.Infrastructure;

namespace SLab5.Services
{
    public class IdentityService : IIdentityService
    {

        private readonly SLabDBContext _context;

        public IdentityService(SLabDBContext context)
        {
            _context = context;
        }

        public User SignIn(SignInDTO signInDto)
        {
            var user = _context.User.ToList().Find(user => user.Login == signInDto.Login);
            
            if (user == null)
            {
                throw new BadHttpRequestException("Incorrect credentials");
            }

            return user;
        }
    }
}