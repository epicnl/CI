# CI
CI test repository

https://medium.com/@JoeHonour/a-guide-to-setting-up-a-net-core-project-using-docker-with-integrated-unit-and-component-tests-a326ca5a0284

# docker tag c9bf75fffad5 registry.digitalocean.com/agilenav/ciconsoletest
# docker push registry.digitalocean.com/agilenav/ciconsoletest



# start new service script
dotnet new sln -n [newservicename] -o .

dotnet new webapi -n [newservicename].Service -o ./src/[newservicename].Service/
dotnet sln [newservicename].sln add ./src/[newservicename].Service/[newservicename].Service.csproj
dotnet new xunit -n [newservicename].Test -o ./test/[newservicename].Test/
dotnet sln [newservicename].sln add ./test/[newservicename].Test/[newservicename].Test.csproj
dotnet add ./test/[newservicename].Test/[newservicename].Test.csproj reference ./src/[newservicename].Service/[newservicename].Service.csproj


