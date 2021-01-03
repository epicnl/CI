# CI
CI test repository

Inspiring video from Rob Richardson who builds, tests, pushes and deploys a .net core docker image
https://www.youtube.com/watch?v=TMbXwNtuAJo&list=WL&index=5&t=1459s

Step by step creating test project and testing docker image after build
https://medium.com/@JoeHonour/a-guide-to-setting-up-a-net-core-project-using-docker-with-integrated-unit-and-component-tests-a326ca5a0284


# start new service script
dotnet new sln -n [newservicename] -o .

dotnet new webapi -n [newservicename].Service -o ./src/[newservicename].Service/
dotnet sln [newservicename].sln add ./src/[newservicename].Service/[newservicename].Service.csproj
dotnet new xunit -n [newservicename].Test -o ./test/[newservicename].Test/
dotnet sln [newservicename].sln add ./test/[newservicename].Test/[newservicename].Test.csproj
dotnet add ./test/[newservicename].Test/[newservicename].Test.csproj reference ./src/[newservicename].Service/[newservicename].Service.csproj


