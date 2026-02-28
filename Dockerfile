# ================================================
# ONYX Turbine Telemetry Worker - Multi-stage build
# ================================================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY *.sln .
COPY src/Worker/Worker.csproj src/Worker/
RUN dotnet restore src/Worker/Worker.csproj

COPY src/Worker/ src/Worker/
WORKDIR /src/src/Worker
RUN dotnet publish -c Release -o /app

# ================================================
# Runtime image
# ================================================
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

COPY --from=build /app .

RUN adduser --disabled-password --gecos "" appuser
USER appuser

ENTRYPOINT ["dotnet", "Worker.dll"]

