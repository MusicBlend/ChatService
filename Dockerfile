FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app 
#
# copy csproj and restore as distinct layers
COPY *.sln .
COPY ChatService/*.csproj ./ChatService/
COPY ChatService.Persistence/*.csproj ./ChatService.Persistence/
COPY ChatService.Domain/*.csproj ./ChatService.Domain/
#
RUN dotnet restore 
#
# copy everything else and build app
COPY ChatService/. ./ChatService/
COPY ChatService.Persistence/. ./ChatService.Persistence/
COPY ChatService.Domain/. ./ChatService.Domain/
#
WORKDIR /app/ChatService.
RUN dotnet publish -c Release -o out 
#
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app 
#
COPY --from=build /app/ChatService/out ./

EXPOSE 80
ENTRYPOINT ["dotnet", "ChatService.dll"]