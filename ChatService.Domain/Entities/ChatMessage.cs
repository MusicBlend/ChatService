using System;

namespace ChatService.Domain.Entities
{
    public class ChatMessage
    {
        public Guid Id { get; set; }
        public string User { get; set; }
        public string Message { get; set; }
        public DateTime SendDate { get; set; }
    }
}