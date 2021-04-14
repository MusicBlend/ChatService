using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ChatService.Domain.Entities;
using ChatService.Domain.Interfaces.IRepository;
using ChatService.Persistence.Repository;
using Microsoft.AspNetCore.Mvc;

namespace ChatService.Controllers
{
    public class CommunityController : ControllerBase
    {
        private readonly ICommunityRepository _communityRepository;

        public CommunityController(ICommunityRepository communityRepository)
        {
            _communityRepository = communityRepository;
        }
        
        public async Task CreateCommunity(string communityName, string userId, string userName, string connectionId)
        {
            Connection newConnection = new Connection()
            {
                ConnectionId = connectionId
            };
            
            User firstUser = new User()
            {
                Id = userId,
                Admin = true,
                Name = userName,
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
        public string GenerateRoomCode()
        {
            UniqueId uniqueId = new UniqueId();
            return uniqueId.GetBase36(6);
        }
        
    }
}