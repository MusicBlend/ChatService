using System;
using System.Text;

namespace ChatService.Controllers
{
    public class UniqueId
    {
        private static readonly char[] Base62Chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                .ToCharArray();

        private static readonly Random Random = new Random();
        
        public string GetBase36(int length)
        {
            var sb = new StringBuilder(length);
            for (int i=0; i<length; i++) 
                sb.Append(Base62Chars[Random.Next(36)]);

            return sb.ToString();
        }
    }
}