FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ["Blazor.Api/Blazor.Api.csproj", "Blazor.Api/"]
RUN dotnet restore "Blazor.Api/Blazor.Api.csproj"
COPY . .
WORKDIR "/src/Blazor.Api"
RUN dotnet build "Blazor.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Blazor.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Blazor.Api.dll"]