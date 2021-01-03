# CI
CI test repository



# docker tag c9bf75fffad5 registry.digitalocean.com/agilenav/ciconsoletest
# docker push registry.digitalocean.com/agilenav/ciconsoletest

dotnet new sln -n CiConsoleTest -o .
dotnet sln CiConsoleTest.sln add ./CiConsoleTest/CiConsoleTest.csproj
dotnet sln CiConsoleTest.sln add ./CiConsoleTest.Test/CiConsoleTest.Test.csproj

