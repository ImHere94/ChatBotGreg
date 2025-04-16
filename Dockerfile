FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

COPY ["ChatBotGreg.csproj", "./"]
RUN dotnet restore "ChatBotGreg.csproj"

COPY . .
RUN dotnet publish "ChatBotGreg.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "ChatBotGreg.dll"]
