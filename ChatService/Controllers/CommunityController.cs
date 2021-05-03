using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ChatService.Domain.Entities;
using ChatService.Domain.Interfaces.IRepository;
using ChatService.Persistence.Repository;
using Microsoft.AspNetCore.Mvc;

namespace ChatService.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CommunityController : ControllerBase
    {
        private readonly ICommunityRepository _communityRepository;

        public CommunityController(ICommunityRepository communityRepository)
        {
            _communityRepository = communityRepository;
        }

        [HttpGet("/GetCommunities/{userId}")]
        public async Task<IEnumerable<string>> GetCommunities(string userId)
        {
            return await _communityRepository.GetUserCommunities(userId);
        }
        
    }
}