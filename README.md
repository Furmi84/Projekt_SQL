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

## Popis
Skript provádí následující úkoly:
- Načítání specifikované webové stránky.
- Extrahování dat z tabulek na stránce.
- Filtrace a zpracování dat podle potřeby.
- Ukládání výsledků do souboru CSV.

## Technologie
Projekt je napsán v Pythonu a využívá knihovny:
- `BeautifulSoup4` pro parsování HTML.
- `requests` pro získání obsahu webu.
- `csv` pro práci s CSV soubory.
- `os` a `sys` pro manipulaci se soubory a systémové volání.

## Instalace
Pro spuštění skriptu je potřeba mít nainstalovaný Python a následující knihovny:
```
pip install beautifulsoup4
pip install requests
```
## Spouštění aplikace
Pomoci příkazového řádku.
Příklad:
```
python main.py 'https://volby.cz/pls/ps2017nss/ps32?xjazyk=CZ&xkraj=12&xnumnuts=7103' 'vysledky_voleb.csv'
```

První argument - adresa ze kterého ma program načítat informace
Druhý argument - jméno souboru ve formatu csv

## Běh aplikace
Pokud aplikace běži správně, zobrazí se tato hlaška v terminálu:
```
Pracuji .........................
```
Po skončení aplikace se zobrazi informace o ukončeni a 
## Konec aplikace a výsledky
Po skončení aplikace se zobrazi hlaška o ukončení programu a jmenem souboru kde jsou uloženy výsledky.
Ukončení programu může vypadat takto:
```
Prace skoncena, soubor uložen se jmenem vysledky_voleb.csv

```
Úkazka výsledku:
```
kod;nazev_obce; Voliči v seznamu ; Odevzdané obálky ; Platné hlasy ; Občanská demokratická strana ; Řád národa - Vlastenecká unie ; CESTA ODPOVĚDNÉ SPOLEČNOSTI ; Česká str.sociálně demokrat. ; Radostné Česko ; STAROSTOVÉ A NEZÁVISLÍ ; Komunistická str.Čech a Moravy ; Strana zelených ; ROZUMNÍ-stop migraci,diktát.EU ; Strana svobodných občanů ; Blok proti islam.-Obran.domova ; Občanská demokratická aliance ; Česká pirátská strana ; Referendum o Evropské unii ; TOP 09 ; ANO 2011 ; Dobrá volba 2016 ; SPR-Republ.str.Čsl. M.Sládka ; Křesť.demokr.unie-Čs.str.lid. ; Česká strana národně sociální ; REALISTÉ ; SPORTOVCI ; Dělnic.str.sociální spravedl. ; Svob.a př.dem.-T.Okamura (SPD) ; Strana Práv Občanů 
 506761 ; Alojzov ; 205 ; 145 ; 144 ; 29 ; 0 ; 0 ; 9 ; 0 ; 5 ; 17 ; 4 ; 1 ; 1 ; 0 ; 0 ; 18 ; 0 ; 5 ; 32 ; 0 ; 0 ; 6 ; 0 ; 0 ; 1 ; 1 ; 15 ; 0 
 589268 ; Bedihošť ; 834 ; 527 ; 524 ; 51 ; 0 ; 0 ; 28 ; 1 ; 13 ; 123 ; 2 ; 2 ; 14 ; 1 ; 0 ; 34 ; 0 ; 6 ; 140 ; 0 ; 0 ; 26 ; 0 ; 0 ; 0 ; 0 ; 82 ; 1 
 
```# Projekt_SQL
Projekt č.4 - Datova analyza - SQL
