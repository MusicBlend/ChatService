﻿// <auto-generated />
using System;
using ChatService.Persistence.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace ChatService.Persistence.Migrations
{
    [DbContext(typeof(AppDbContext))]
    [Migration("20210423114817_removedUsername")]
    partial class removedUsername
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 64)
                .HasAnnotation("ProductVersion", "5.0.4");

            modelBuilder.Entity("ChatService.Domain.Entities.ChatMessage", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("char(36)");

                    b.Property<Guid?>("CommunityId")
                        .HasColumnType("char(36)");

                    b.Property<string>("Message")
                        .HasColumnType("longtext");

                    b.Property<DateTime>("SendDate")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("User")
                        .HasColumnType("longtext");

                    b.HasKey("Id");

                    b.HasIndex("CommunityId");

                    b.ToTable("ChatMessages");
                });

            modelBuilder.Entity("ChatService.Domain.Entities.Community", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("char(36)");

                    b.Property<string>("CommunityName")
                        .HasColumnType("longtext");

                    b.Property<string>("RoomCode")
                        .HasColumnType("longtext");

                    b.HasKey("Id");

                    b.ToTable("Communities");
                });

            modelBuilder.Entity("ChatService.Domain.Entities.Connection", b =>
                {
                    b.Property<string>("ConnectionId")
                        .HasColumnType("varchar(255)");

                    b.Property<string>("UserId")
                        .HasColumnType("varchar(255)");

                    b.HasKey("ConnectionId");

                    b.HasIndex("UserId");

                    b.ToTable("Connections");
                });

            modelBuilder.Entity("ChatService.Domain.Entities.User", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)");

                    b.HasKey("Id");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("CommunityUser", b =>
                {
                    b.Property<Guid>("CommunitiesId")
                        .HasColumnType("char(36)");

                    b.Property<string>("UsersId")
                        .HasColumnType("varchar(255)");

                    b.HasKey("CommunitiesId", "UsersId");

                    b.HasIndex("UsersId");

                    b.ToTable("CommunityUser");
                });

            modelBuilder.Entity("ChatService.Domain.Entities.ChatMessage", b =>
                {
                    b.HasOne("ChatService.Domain.Entities.Community", null)
                        .WithMany("Messages")
                        .HasForeignKey("CommunityId");
                });

            modelBuilder.Entity("ChatService.Domain.Entities.Connection", b =>
                {
                    b.HasOne("ChatService.Domain.Entities.User", null)
                        .WithMany("Connections")
                        .HasForeignKey("UserId");
                });

            modelBuilder.Entity("CommunityUser", b =>
                {
                    b.HasOne("ChatService.Domain.Entities.Community", null)
                        .WithMany()
                        .HasForeignKey("CommunitiesId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ChatService.Domain.Entities.User", null)
                        .WithMany()
                        .HasForeignKey("UsersId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("ChatService.Domain.Entities.Community", b =>
                {
                    b.Navigation("Messages");
                });

            modelBuilder.Entity("ChatService.Domain.Entities.User", b =>
                {
                    b.Navigation("Connections");
                });
#pragma warning restore 612, 618
        }
    }
}
