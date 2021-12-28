using SLab5.DTO;
using SLab5.Entity;

namespace SLab5.Services
{
    public interface IIdentityService
    {
        public User SignIn(SignInDTO signInDto);

        public User SignUp(SignUpDTO signUpDto);
    }
}