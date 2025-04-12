# Use the official .NET image from Docker Hub
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Use the SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["SelfPortfolio2/SelfPortfolio2.csproj", "SelfPortfolio2/"]
RUN dotnet restore "SelfPortfolio2/SelfPortfolio2.csproj"
COPY . .
WORKDIR "/src/SelfPortfolio2"
RUN dotnet build "SelfPortfolio2.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SelfPortfolio2.csproj" -c Release -o /app/publish

# Copy the build artifacts from the publish stage to the base image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SelfPortfolio2.dll"]