# Mini E-handel – SQL Relationsdatabasprojekt

## Beskrivning
Detta projekt är en mini e-handel som visar hur man designar och använder en relationsdatabas.
Projektet innehåller:
- ER-diagram
- SQL-scripts för att skapa och använda databasen
- CRUD-operationer
- En Console App i .NET kopplad till SQL Server med Entity Framework Core

Syftet är att visa förståelse för databaser, relationer och hur en applikation kopplas mot en databas.

---

## Val av entiteter
Jag valde följande entiteter eftersom de speglar en verklig e-handel:

- **Customer** – lagrar kunder
- **Category** – grupperar produkter
- **Product** – produkter som säljs
- **Order** – kundernas beställningar
- **OrderItem** – koppling mellan order och produkter (många-till-många)
- **Store** – lagersaldo för produkter

Dessa entiteter gör det möjligt att hantera kunder, produkter, ordrar och lager på ett realistiskt sätt.

---

## Normalisering
Databasen är normaliserad till ungefär **tredje normalformen (3NF)**:
- Ingen upprepande data lagras i samma tabell
- Varje tabell har ett tydligt ansvar
- Många-till-många relationer hanteras med en kopplingstabell (OrderItem)
- Produktinformation lagras bara en gång och refereras via främmande nycklar

Detta minskar dataduplicering och gör databasen lättare att underhålla.

---

## Constraints och dataintegritet
Följande constraints används för att skydda datan:
- **Primary Keys (PK)** i alla tabeller
- **Foreign Keys (FK)** för alla relationer
- **NOT NULL** på viktiga kolumner som inte får vara tomma
- **UNIQUE** på exempelvis e-postadress för kund
- **DEFAULT-värden**, t.ex. datum och status

Dessa regler säkerställer att ogiltig eller inkonsekvent data inte kan sparas.

---

## Console App
🖥️ Console App (.NET + EF Core)

Projektet innehåller även en Console App i .NET som är kopplad till databasen MiniEhandelDB via Entity Framework Core.

I Console Appen har jag:

Skapat en Product-klass som matchar tabellen i databasen

Skapat ett DbContext för koppling mot SQL Server Express

Kopplat upp applikationen mot databasen

Hämtat alla produkter från databasen

Skrivit ut produktinformation snyggt i konsolen (SELECT-query)

Detta visar hur C#-kod kan användas för att läsa data från en relationsdatabas.

Applikationen använder EF Core för att översätta C#-kod till SQL-frågor.

---

## Vad jag skulle förbättra i nästa steg
I nästa steg vill jag arbeta mer från applikationssidan istället för direkt i SQL Server.

Jag skulle vilja:
- Skapa hela databasen via Console Appen med Entity Framework Core
- Träna mer på att göra INSERT, UPDATE och DELETE från C#
---

