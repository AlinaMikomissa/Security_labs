using System;

namespace SLab5.Entity
{
    public class User
    {
        public Guid ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Login { get; set; }
        public byte[] PasswordHash { get; set; }
        public DateTime CreateTime { get; set; }
    }
}