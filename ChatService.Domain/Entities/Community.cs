using System;
using System.Collections.Generic;

namespace ChatService.Domain.Entities
{
    public class Community
    {
        public Guid Id { get; set; }
        public string CommunityName { get; set; }
        public string RoomCode { get; set; }
        public ICollection<ChatMessage> Messages { get; set; } = new List<ChatMessage>();
        public virtual ICollection<User> Users { get; set; } = new List<User>();
    }
}