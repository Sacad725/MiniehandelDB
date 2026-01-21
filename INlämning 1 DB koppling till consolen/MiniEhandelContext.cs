using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;

namespace INlämning_1_DB_koppling_till_consolen
{
    internal class MiniEhandelContext : DbContext
    {
        // Detta säger: det finns en tabell Product i databasen
        public DbSet<Product> Products { get; set; }
        

        // Här anger vi vilken databas som används
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlServer(
                "Server=sacad\\SQLEXPRESS;Database=MiniEhandelDB;Trusted_Connection=True;TrustServerCertificate=True;"

            );

        }


        // Här mappar vi tabellnamnet exakt så det ska 
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>().ToTable("Product");
        }
    }

}
