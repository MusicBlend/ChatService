using System.Net.Security;
using System.Threading.Tasks;
using ChatService.Domain.Entities;
using ChatService.Domain.Interfaces.IRepository;
using ChatService.Persistence.Data;

namespace ChatService.Persistence.Repository
{
    public class CommunityRepository : ICommunityRepository
    {
        private readonly AppDbContext _dbContext;
        
        public CommunityRepository(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task CreateCommunity(Community newCommunity)
        {
           await _dbContext.Communities.AddAsync(newCommunity);
           await _dbContext.SaveChangesAsync();
        }
    }
}