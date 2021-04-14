using System.Threading.Tasks;
using ChatService.Domain.Entities;

namespace ChatService.Domain.Interfaces.IRepository
{
    public interface ICommunityRepository
    {
        Task CreateCommunity(Community newCommunity);
    }
}