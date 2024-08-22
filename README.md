# Projekt č.4 Engeto Akademie SQL

## Zadaní
Pomozte kolegům s daným úkolem. Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Tabulky pojmenujte t_{jmeno}_{prijmeni}_project_SQL_primary_final (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) a t_{jmeno}_{prijmeni}_project_SQL_secondary_final (pro dodatečná data o dalších evropských státech).

Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

Výzkumné otázky:
- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
- Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

## Seznam souboru a popis funkce
Seznam souboru:
- `vytvoreni_tabulky.sql` vytvořeni tabulky t_martin_furmanek_project_SQL_primary_final.
- ` vytvořeni tabulky t_martin_furmanek_project_SQL_secondary_final.sql` vytvořeni tabulky t_martin_furmanek_project_SQL_secondary_final.
- `otazka_1.sql` sql skript,který vypocita rozdil platu v prubehu let pro všechny odvětví.
- `otazka_1_v2.sql` sql skript který vypočita rozdil platu v pruběhu let a zobrazi jen ty odvětví ktere maji v zaporné přirustek.
- `otazka_2.sql` sql skript,který vypočita kolik chleba a mléka lze koupit za rok 2006 a 2018
- `otazka_3.sql` sql skript, který vypočitáva procentualní přirustek ceny pro všechny potraviny během let.
- `otazka_3_v2.sql` sql skript, ktery procentualní přirustek během let od nejmenšího k největšímu.
- `otazka_4.sql` sql skript, ktery zobrazí roky kde je procentualní změna potravin a procentualní změna platu větší než 10%.
- `otazka_5_sql` sql skript, ktery zobrazuje vazbu mezi HDP ČR a platu.
- `otazka_5_v2.sql` sql skript, ktery zobrazuje vazbu mezi HDP ČR a cenu potravin.


## Odpovědí na otázky
- `Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?` Průběhu let, mzdy nerostou ve všech odvětvích rovnoměrně. Zde jsou uvedeno 5 odvětví a roky, kde byl pokles mezd největší:
  
      1. **Peněžnictví a pojišťovnictví**:
       - 2013: -4473,00 Kč

      2. **Výroba a rozvod elektřiny, plynu, tepla a klimatizovaného vzduchu**:
       - 2013: -1807,50 Kč
       - 2015: -436,75 Kč

      3. **Těžba a dobývání**:
       - 2009: -1275,50 Kč
       - 2013: -801,25 Kč
       - 2014: -315,50 Kč
       - 2016: -191,50 Kč

      4. **Profesní, vědecké a technické činnosti**:
       - 2010: -189,25 Kč
       - 2013: -867,00 Kč

      5. **Veřejná správa a obrana; povinné sociální zabezpečení**:
       - 2010: -84,75 Kč
       - 2011: -583,25 Kč
      
      Nejméně stabilní růst mezd bylo zaznamenáno v odvětví Peněžnictví a pojišťovnictví, kde standardní odchylka změn průměrných mezd byla nejvyšší, konkrétně 2496,81 Kč. To naznačuje, že toto odvětví mělo nejvíce kolísající růst mezd v porovnání s ostatními odvětvími.
  
      Nejstabilnější růst mezd bylo zaznamenáno v odvětví Ostatní činnosti, kde standardní odchylka změn průměrných mezd byla nejnižší, konkrétně 389,55 Kč. To znamená, že toto odvětví mělo nejvíce konzistentní růst mezd v porovnání s ostatními odvětvími.

  ![image](https://github.com/user-attachments/assets/0e4e07ce-c65c-4cec-9ee4-efef27ae4c58)

      Zde je graf zobrazující růst mezd v jednotlivých odvětvích napříč všemi roky. Každý sloupec představuje jeden rok, a různé barvy ve sloupci reprezentují příspěvky jednotlivých odvětví k celkovému růstu mezd v daném roce.

  
- `Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?` Vysledek zobrazuje skript `otazka_2.sql`
  
- `Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?` Nejnížší meziroční nárust byl v roce 2009, kde nejvíce zlevnilo pečivo bíle pšeničné a jablko konzumní, pote ještě zlevníla pšeničná mouka hladká.
  
- `Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?` Vysledek zobrazuje skript `otazka_4.sql`
  
- `Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?` Vysledek lze videt na grafech.
  ![image](https://github.com/user-attachments/assets/f065ea8e-8a51-4960-9762-83c00cf4c558)

  Pro ukazku jsem zvolil jen dvě položky
  ![image](https://github.com/user-attachments/assets/95a09ddb-fd89-4b2c-9dbc-6b93bc6c904d)

  U platu lze při rustu HDP vidět u růst platů, u dvou položek potravín toto neplati, asi vzhledem k tomu že tyto suroviny se do ČR dovažeji a cena je určena jinak.



