using System;
using System.Linq;
using System.Text;
using Konscious.Security.Cryptography;
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
            var user = _context.User.ToList().Find(user => user.Login == signInDto.Login && Enumerable.SequenceEqual(user.PasswordHash, HashPassword(signInDto.Password, user.CreateTime.ToString())));
            
            if (user == null)
            {
                throw new BadHttpRequestException("Incorrect credentials");
            }

            return user;
        }

        public User SignUp(SignUpDTO signUpDto)
        {
            var creationDate = DateTime.Now;
            
            var user = new User()
            {
                ID = Guid.NewGuid(),
                FirstName = signUpDto.FirstName,
                LastName = signUpDto.LastName,
                Login = signUpDto.Login,
                PasswordHash = HashPassword(signUpDto.Password, creationDate.ToString()),
                CreateTime = creationDate
            };

            _context.User.Add(user);
            _context.SaveChanges();

            return user;
        }

        private byte[] HashPassword(string password, string salt)
        {
            var argon2 = new Argon2id(Encoding.UTF8.GetBytes(password));
            
            argon2.Salt = Encoding.ASCII.GetBytes(salt);
            argon2.DegreeOfParallelism = 8;
            argon2.Iterations = 4;
            argon2.MemorySize = 512 * 512; 
            
            return argon2.GetBytes(16);
        }
    }
}