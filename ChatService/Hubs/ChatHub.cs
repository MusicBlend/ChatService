using System;
using System.Threading.Tasks;
using ChatService.Controllers;
using ChatService.Domain.Entities;
using ChatService.Domain.Interfaces.IRepository;
using ChatService.Hubs.Clients;
using Microsoft.AspNetCore.SignalR;

namespace ChatService.Hubs
{
    public class ChatHub : Hub
    {
        private readonly ICommunityRepository _communityRepository;
        public ChatHub(ICommunityRepository communityRepository)
        {
            _communityRepository = communityRepository;
        }
        public async Task SendMessage(ChatMessage message)
        {
            await Clients.All.SendAsync("ReceiveMessage", message);
        }

        // public async Task JoinCommunity(string communityName)
        // {
        //     await Groups.AddToGroupAsync(Context.ConnectionId, communityName);
        // }
        
        public async Task SendMessageToCommunity(string communityId, ChatMessage message)
        {
            Console.WriteLine(message.Message);
            Console.WriteLine(communityId);
            await Clients.Group(communityId).SendAsync("ReceiveMessage", message);
        }
        public async Task CreateCommunity(string communityName, string userId)
        {
            Guid communityId = Guid.NewGuid();
            await Groups.AddToGroupAsync(Context.ConnectionId, communityId.ToString());
            await SaveCommunity(communityId, communityName, userId, Context.ConnectionId);
        }
        public async Task JoinCommunity(string userId, string roomCode)
        {
            roomCode = roomCode.Replace(" ", "");
            var community = await _communityRepository.FindCommunity(roomCode);

            await Groups.AddToGroupAsync(Context.ConnectionId, community.Id.ToString());

            bool userExists = await _communityRepository.UserExists(userId);
            
            var newConnection = new Connection()
            {
                ConnectionId = Context.ConnectionId
            };
            if (userExists)
            {
                var user = await _communityRepository.GetUser(userId);
                await _communityRepository.AddUserToCommunity(userId, roomCode);
                user.Connections.Add(newConnection);
            }
            else
            {
                var newUser = new User()
                {
                    Id = userId,
                };
                await _communityRepository.CreateUser(newUser);
                newUser.Connections.Add(newConnection);
                await _communityRepository.AddUserToCommunity(userId, roomCode);
            }
        }
        
        private async Task SaveCommunity(Guid communityId, string communityName, string userId, string connectionId)
        {
            Connection newConnection = new Connection()
            {
                ConnectionId = connectionId
            };
            Community newCommunity = new Community()
            {
                Id = communityId,
                CommunityName = communityName,
                RoomCode = GenerateRoomCode(),
            };
            
            //search if user exists
            if (await _communityRepository.UserExists(userId))
            {
                var user = await _communityRepository.GetUser(userId);
                user.Connections.Add(newConnection);
                newCommunity.Users.Add(user);
                await _communityRepository.CreateCommunity(newCommunity);
            }
            else
            {
                User firstUser = new User()
                {
                    Id = userId
                };
                firstUser.Connections.Add(newConnection);
                newCommunity.Users.Add(firstUser);
                await _communityRepository.CreateCommunity(newCommunity);
            }
        }
        private string GenerateRoomCode()
        {
            UniqueId uniqueId = new UniqueId();
            return uniqueId.GetBase36(6);
        }
    }
}