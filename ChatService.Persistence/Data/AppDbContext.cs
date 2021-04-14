using ChatService.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace ChatService.Persistence.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
            
        }
        public DbSet<ChatMessage> ChatMessages { get; set; }
        public DbSet<Community> Communities { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Connection> Connections { get; set; }
        
    }
}