# ========================
# Build stage
# ========================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the project file and restore dependencies
COPY Application.csproj ./
RUN dotnet restore

# Copy all other files
COPY . ./

# Publish the project to /app/out
RUN dotnet publish Application.csproj -c Release -o /app/out

# ========================
# Runtime stage
# ========================
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy published output from build stage
COPY --from=build /app/out ./

# Expose Render default port
EXPOSE 8080

# Start the application
ENTRYPOINT ["dotnet", "Application.dll"]


