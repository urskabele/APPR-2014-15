# Analiza podatkov s programom R, 2014/15

Avtor: Urška Bele

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

Za temo mojega projekta sem izbrala Olimpijske igre moderne dobe. V projektu bom za posamezne olimpijske igre (poletne in zimske) v tabeli navedla podatke: mesto, ki je gostilo OI (imenska spremenljivka); država gostiteljica (imenska spremenljivka); število držav, ki so se iger udeležile (številska spremenljivka); razsežnost* (urejenostna spremenljivka); število disciplin, v katerih so se šprtniki pomerili (številska spremenljivka); država, ki je skupno prejela največ medalj (številska spremenljivka).

Cilji:
V projektu bom na podlagi zgornjih podatkov lahko določila državo, ki je OI priredila največkrat. Izračunala bom maksimalno, minimalno in povprečno število držav udeleženk, disciplin in prejetih medalj. Olimpijske igre bom razvrstila v kategorije razsežnosti glede na število udeleženk. Dobljene rezultate bom prikazala tudi na zemljevidu.

Podatki:
Podatke bom pridobila s spletnih strani Wikipedije, kjer obstaja članek za vsake olimpijske igre posebej (npr. http://en.wikipedia.org/wiki/2012_Summer_Olympics). Podatke, ki jih potrebujem, bom zbrala v tabelo in jo shranila kot CSV, da jo bom lahko uvozila v R in obdelala podatke.

*razsežnost: Oblikovala bom več kategorij glede na število držav, ki so se OI udeležile. Ko bom imela zbrane podatke bom določila meje kategorij ter na podlagi podatka o številu držav udeleženk olimpijske igre razporedila v eno izmed teh (npr. kategorije 1, 2, 3).

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
