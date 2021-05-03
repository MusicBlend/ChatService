using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ChatService.Domain.Entities
{
    public class User
    {
        public string Id { get; set; }
        public ICollection<Connection> Connections { get; set; } = new List<Connection>();
        public virtual ICollection<Community> Communities { get; set; } = new List<Community>();
    }
}