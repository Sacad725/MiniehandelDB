using Microsoft.EntityFrameworkCore;

namespace INlämning_1_DB_koppling_till_consolien
{

    // DbContext-klassen för applikationen och dess koppling till databasen
    public class AppDbContext : DbContext
    {
        // Konfigurerar databaskopplingen till SQL Server med angiven anslutningssträng
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            // min anslutningssträng till databasen på min lokala SQL Server Express instans
            options.UseSqlServer(
                "Server=sacad\\SQLEXPRESS;Database=MiniEhandelDB;Trusted_Connection=True;TrustServerCertificate=True"
            );
        }
    }
}
