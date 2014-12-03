# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke CSV Tabela OI.csv
uvozi1 <- function() {
  return(read.csv("podatki/tabela1.csv", header=TRUE,as.is = TRUE, sep=";",
                      na.strings="-",fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o OI...\n")
OI <- uvozi1()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.