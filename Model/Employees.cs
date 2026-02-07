using System.ComponentModel.DataAnnotations;

namespace Application.Model
{
    public class Employees
    {

        public Guid Id { get; set; }= Guid.NewGuid();

        [Required]
        [StringLength(120)]
        public required string Name { get; set; }

        [Required]
        [StringLength (80)]
        [EmailAddress]
        public required string Email { get; set; }

        [Required]
        [Phone]
        [StringLength(10)]
        public required string Phone { get; set; }
    }

   
       
       

    }
