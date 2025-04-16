FROM mcr.microsoft.com/dotnet/sdk:9.0-preview AS build
WORKDIR /src

COPY ["ChatBotGreg/ChatBotGreg.csproj", "ChatBotGreg/"]
RUN dotnet restore "ChatBotGreg/ChatBotGreg.csproj"

COPY . .
RUN dotnet publish "ChatBotGreg/ChatBotGreg.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:9.0-preview
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "ChatBotGreg.dll"]
