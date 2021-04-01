using System.Threading.Tasks;
using ChatService.Domain.Entities;

namespace ChatService.Hubs.Clients
{
    public interface IChatClient
    {
        Task ReceiveMessage(ChatMessage message);
    }
}