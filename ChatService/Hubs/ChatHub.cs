using System;
using System.Threading.Tasks;
using ChatService.Controllers;
using ChatService.Domain.Entities;
using ChatService.Domain.Interfaces.IRepository;
using ChatService.Hubs.Clients;
using Microsoft.AspNetCore.SignalR;

namespace ChatService.Hubs
{
    public class ChatHub : Hub<IChatClient>
    {
        private readonly ICommunityRepository _communityRepository;
        public ChatHub(ICommunityRepository communityRepository)
        {
            _communityRepository = communityRepository;
        }
        public async Task SendMessage(ChatMessage message)
        {
            await Clients.All.ReceiveMessage(message);
        }

        public async Task JoinCommunity(string communityName)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, communityName);
        }
        public async Task CreateCommunity(string communityName, string userId, string username)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, communityName);
            await SaveCommunity(communityName, userId, Context.ConnectionId, username);
        }
        public async Task SendMessageToCommunity(string communityName, ChatMessage message)
        {
            await Clients.Group(communityName).ReceiveMessage(message);
        }
        
        private async Task SaveCommunity(string communityName, string userId, string connectionId, string username)
        {
            //search if user exists
            //if not add user
            Connection newConnection = new Connection()
            {
                ConnectionId = connectionId
            };
            
            User firstUser = new User()
            {
                Id = userId,
                Admin = true,
                Name = username,
            };
            
            Community newCommunity = new Community()
            {
                Id = Guid.NewGuid(),
                CommunityName = communityName,
                RoomCode = GenerateRoomCode(),
            };
            firstUser.Connections.Add(newConnection);
            newCommunity.Users.Add(firstUser);
            await _communityRepository.CreateCommunity(newCommunity);
        }
        private string GenerateRoomCode()
        {
            UniqueId uniqueId = new UniqueId();
            return uniqueId.GetBase36(6);
        }
    }
}