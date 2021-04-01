﻿using System;
using ChatService.Persistence.Data;
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

            //services.AddTransient<IUserRepository, UserRepository>();

            return services;
        }
    }
}