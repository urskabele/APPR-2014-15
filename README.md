# Analiza podatkov s programom R, 2014/15

Avtor: Urška Bele

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

Za temo mojega projekta sem izbrala Olimpijske igre moderne dobe. V projektu bom za posamezne olimpijske igre (poletne in zimske) v dveh tabelah navedla različne podatke.
Prva tabela (v HTML obliki) vsebuje podatke: mesto (imenska spremenljivka); država (imeska); kontinent (imeska); zaporedna številka; vrsta (imeska); leto (številska). Tabela: http://en.wikipedia.org/wiki/List_of_Olympic_Games_host_cities
Druga tabela (v CSV obliki) vsebuje podatke: vrsta OI (imenska spremenljivka); število držav udeleženk (številska); število športnikov (številska); razsežnost glede na število držav udeleženk (urejenostna); število športov (številska); število dogodkov (številska); država z največ medaljami (številska).

Cilji:
V projektu bom na podlagi zgornjih podatkov lahko določila državo, ki je OI priredila največkrat. Izračunala bom maksimalno, minimalno in povprečno število držav udeleženk, disciplin in prejetih medalj. Olimpijske igre bom razvrstila v kategorije razsežnosti glede na število udeleženk. Dobljene rezultate bom prikazala tudi na zemljevidu.

Podatki:
Nekatere podatke sem dobila že zbrane v tabeli na spletni strani http://en.wikipedia.org/wiki/List_of_Olympic_Games_host_cities.
Podatke za drugo tabelo sem pridobila s spletnih strani Wikipedije, kjer obstaja članek za vsake olimpijske igre posebej (npr. http://en.wikipedia.org/wiki/2012_Summer_Olympics). Podatke sem zbrala v tabelo in jo shranila kot CSV, da jo bom lahko uvozila v R in obdelala podatke.



## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
