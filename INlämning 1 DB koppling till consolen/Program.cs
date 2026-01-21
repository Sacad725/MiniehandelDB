using INlämning_1_DB_koppling_till_consolen;
using System;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;


namespace INlämning_1_DB_koppling_till_consolien
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Skapar koppling till databasen
            using (var context = new MiniEhandelContext())
            {
                Console.WriteLine("Produkter i databasen:\n");

                // Loopar igenom alla produkter (SELECT)
                foreach (var p in context.Products)
                {
                    Console.WriteLine(
                        $"ID: {p.ProductId} | Namn: {p.Name} | Pris: {p.Price} kr | Aktiv: {p.IsActive}"
                    );
                }
            }

            Console.WriteLine("\nTryck på valfri tangent för att avsluta...");
            Console.ReadKey();
        }
    }
}
