using Application.Data.Tables;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

// Add services
builder.Services.AddControllers();
//builder.Services.AddEndpointsApiExplorer();
//builder.Services.AddSwaggerGen();

// Database
builder.Services.AddDbContext<EmployeesDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("EmployeeApp"))
);

var app = builder.Build();

// Swagger in development
//if (app.Environment.IsDevelopment())
//{
  //  app.UseSwagger();
    //app.UseSwaggerUI();
//}

// Serve React frontend
app.UseDefaultFiles();   // Looks for index.html in wwwroot
app.UseStaticFiles();    // Serves static files from wwwroot

app.UseHttpsRedirection();

app.UseAuthorization();

app.UseCors("AllowAll");

app.MapControllers();

// Fallback route for React
app.MapFallbackToFile("index.html");

app.Run();

