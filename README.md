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
- `Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?` Průběhu nerostou mzdy ve všech odvětvích, v některych letech klesaji.
- `Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?` Vysledek zobrazuje skript `otazka_2.sql`
- `Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?` pro práci s CSV soubory.
- `Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?` Vysledek zobrazuje skript `otazka_4.sql`
- `Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?` ro manipulaci se soubory a systémové volání.
  ![image](https://github.com/user-attachments/assets/b257e1cc-45fd-49c1-b481-df716e3663df)

