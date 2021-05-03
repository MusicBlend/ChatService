using System.Collections.Generic;
using System.Threading.Tasks;
using ChatService.Domain.Entities;

namespace ChatService.Domain.Interfaces.IRepository
{
    public interface ICommunityRepository
    {
        Task CreateCommunity(Community newCommunity);
        Task<Community> FindCommunity(string roomCode);
        Task<bool> UserExists(string userId);
        Task<User> GetUser(string userId);
        Task CreateUser(User user);
        Task AddUserToCommunity(string userId, string roomCode);
        Task<List<string>> GetUserCommunities(string userId);
    }
}