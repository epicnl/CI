FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build

WORKDIR /src

COPY *.sln .
COPY CiConsoleTest/*.csproj ./CiConsoleTest/
COPY CiConsoleTest.Test/*.csproj ./CiConsoleTest.Test/

RUN dotnet restore

COPY . .

RUN dotnet build -c Release
RUN dotnet test --logger trx
RUN dotnet publish -c Release -o /dist

FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine

WORKDIR /app

COPY --from=build /dist .

ENV ASPNETCORE_ENVORONMENT Production
ENV ASPNETCORE_URLS http://+:80
EXPOSE 80

CMD ["dotnet", "CiConsoleTest.dll"]

