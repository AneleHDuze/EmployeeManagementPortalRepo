# ========================
# Build stage
# ========================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project file and restore dependencies
COPY Application.csproj ./
RUN dotnet restore

# Copy the rest of the project files
COPY . ./

# Publish the application
RUN dotnet publish -c Release -o out

# ========================
# Runtime stage
# ========================
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy the published output from the build stage
COPY --from=build /app/out ./

# Expose port 8080 (Render default)
EXPOSE 8080

# Start the application
ENTRYPOINT ["dotnet", "Application.dll"]

