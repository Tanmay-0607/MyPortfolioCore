FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "SelfPortfolio2.dll"]