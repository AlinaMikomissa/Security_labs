using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SLab5.Entity;

namespace SLab5.EntityConfigurations
{
    public class UserEntityConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder
                .Property("ID")
                .HasColumnType("uuid")
                .IsRequired();

            builder.Property(e => e.FirstName);
            builder.Property(e => e.LastName);
            builder.Property(e => e.Login);
            builder.Property(e => e.PasswordHash);
        }
    }
}