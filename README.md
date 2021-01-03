# CI
CI test repository



# docker tag c9bf75fffad5 registry.digitalocean.com/agilenav/ciconsoletest
# docker push registry.digitalocean.com/agilenav/ciconsoletest

dotnet new sln -n CiConsoleTest -o .
dotnet sln CiConsoleTest.sln add ./CiConsoleTest/CiConsoleTest.csproj
dotnet sln CiConsoleTest.sln add ./CiConsoleTest.Test/CiConsoleTest.Test.csproj






Dockerfile
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build

WORKDIR /src

COPY *.sln .
COPY CiConsoleTest/*.csproj ./CiConsoleTest
COPY CiConsoleTest.Test/*.csproj ./CiConsoleTest.Test

RUN dotnet restore

COPY . .

RUN dotnet build -c Release
RUN dotnet test
RUN dotnet publish -c Release -o /dist

FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine

WORKDIR /app

COPY --from=build /dist .

ENV ASPNETCORE_ENVORONMENT Production
ENV ASPNETCORE_URLS http://+:80
EXPOSE 80

CMD ["dotnet", "CiConsoleTest.dll"]

