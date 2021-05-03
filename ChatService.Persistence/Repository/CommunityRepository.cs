using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Security;
using System.Threading.Tasks;
using ChatService.Domain.Entities;
using ChatService.Domain.Interfaces.IRepository;
using ChatService.Persistence.Data;
using Microsoft.EntityFrameworkCore;

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
        public async Task CreateUser(User user)
        {
            await _dbContext.Users.AddAsync(user);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<Community> FindCommunity(string roomCode)
        {
            var comm = await _dbContext.Communities.FirstOrDefaultAsync(x => x.RoomCode == roomCode);
            return comm;
        }

        public async Task<bool> UserExists(string userId)
        {
            var user = await _dbContext.Users.FindAsync(userId);
            return user != null;
        }
        public async Task<User> GetUser(string userId)
        {
            var user = await _dbContext.Users.FindAsync(userId);
            return user;
        }
        public async Task AddUserToCommunity(string userId, string roomCode)
        {
            var community = await _dbContext.Communities.FirstOrDefaultAsync(x => x.RoomCode == roomCode);
            var user = await _dbContext.Users.FindAsync(userId);
            community.Users.Add(user);
            _dbContext.Communities.Update(community);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<List<string>> GetUserCommunities(string userId)
        {
            var communityIds = new List<string>();
            
            var communities = await _dbContext.Communities
                .Include(c => c.Users)
                .ToListAsync();
            foreach (var community in communities)
            {
                foreach (var communityUser in community.Users)
                {
                    if (userId == communityUser.Id)
                    {
                        communityIds.Add(community.Id.ToString());
                    }
                }
            }
            return communityIds; 
        }
    }
}