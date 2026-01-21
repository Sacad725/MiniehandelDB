using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;

namespace INlämning_1_DB_koppling_till_consolen
{
    internal class Product
    {
        // Primärnyckel (PK)
        public int ProductId { get; set; }

        // Produktens namn
        public string Name { get; set; }

        // Pris på produkten
        public decimal Price { get; set; }

        // Om produkten är aktiv eller inte
        public bool IsActive { get; set; }

        // Foreign Key till Category
        public int CategoryId { get; set; }
    }
}
