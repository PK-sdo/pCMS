# create the build instance
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app
 
# copy csproj and restore as distinct layers
COPY . ./
RUN dotnet restore
 
# Build runtime image
#FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
EXPOSE 5000
                             
ENTRYPOINT ["dotnet", "run", "--urls", "http://0.0.0.0:5000/"]