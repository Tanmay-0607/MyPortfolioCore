# Use the official .NET 8.0 SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Set the working directory inside the container
WORKDIR /src

# Copy the csproj and restore dependencies
COPY ["SelfPortfolio2/SelfPortfolio2.csproj", "SelfPortfolio2/"]
RUN dotnet restore "SelfPortfolio2/SelfPortfolio2.csproj"

# Copy the rest of the files and build the app
COPY . .
RUN dotnet publish "SelfPortfolio2/SelfPortfolio2.csproj" -c Release -o /app/publish

# Use the official .NET 8.0 ASP.NET runtime image to run the app
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Copy the published app from the build image
COPY --from=build /app/publish .

# Define the entry point for the application
ENTRYPOINT ["dotnet", "SelfPortfolio2.dll"]