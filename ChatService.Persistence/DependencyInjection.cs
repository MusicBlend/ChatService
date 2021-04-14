using System;
using ChatService.Domain.Entities;
using ChatService.Domain.Interfaces.IRepository;
using ChatService.Persistence.Data;
using ChatService.Persistence.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;

namespace ChatService.Persistence
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddPersistence(this IServiceCollection services, string connectionString)
        {
            services.AddDbContext<AppDbContext>(x =>
            {
                x.UseMySql(
                        connectionString,
                        new MariaDbServerVersion(new Version(10, 5, 9)),
                        mysqlOptions => mysqlOptions.CharSetBehavior(CharSetBehavior.NeverAppend))
                    .EnableSensitiveDataLogging()
                    .EnableDetailedErrors();
            });

            services.AddTransient<IChatMessageRepository, ChatMessageRepository>();
            services.AddTransient<ICommunityRepository, CommunityRepository>();
            services.AddTransient<IUserRepository, UserRepository>();

            return services;
        }
    }
}