# ========================
# Build stage
# ========================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the project files and publish
COPY . ./
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

# Start the app
ENTRYPOINT ["dotnet", "Application.dll"]
