using Microsoft.EntityFrameworkCore;
using SLab5.Entity;
using SLab5.EntityConfigurations;

namespace SLab5.Infrastructure
{
    public class SLabDBContext : DbContext
    {
        public SLabDBContext(DbContextOptions options) : base(options)
        {
        }
        
        public DbSet<User> User { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserEntityConfiguration());
            
            base.OnModelCreating(modelBuilder);
        }
    }
}