using Application.Model;
using Microsoft.EntityFrameworkCore;

namespace Application.Data.Tables
{
    public class EmployeesDbContext : DbContext
    {

        public EmployeesDbContext(DbContextOptions<EmployeesDbContext> options) : base(options) 
        {
            
        }

        public DbSet<Employees> Employees { get; set; }
    }
}
