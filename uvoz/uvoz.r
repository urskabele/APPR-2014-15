# # 2. faza: Uvoz podatkov
# 
# # Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvoziDruzine <- function() {
#   return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                       fileEncoding = "Windows-1250"))
# }
# 
# # Zapišimo podatke v razpredelnico druzine.
# cat("Uvažam podatke o družinah...\n")
# druzine <- uvoziDruzine()
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.

# 2. faza: Uvoz podatkov


# UVOZ PRVE CSV TABELE
#Funkcija, ki uvozi podatke iz datoteke tabela1.csv
uvozi1 <- function() {
  return(read.table("podatki/tabela1.csv", sep = ";", as.is = TRUE, header=TRUE,
                    na.strings="-",
                    
                    fileEncoding = "Windows-1250"))

}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o OI...\n")
OI <- uvozi1()

#Uvoz tabele z imenom tabela (mesta)
source("lib/xml.r")
cat("Uvažam podatke o mestih (tabela)...\n")
mesta<-uvozi.tabela()


#UVOZ DRUGE CSV TABELE
# Funkcija, ki uvozi podatke iz datoteke Sportniki2012.csv
uvozi2 <- function() {
  return(read.table("podatki/Sportniki2012.csv", sep = ";", as.is = TRUE, header=TRUE,
                    na.strings="-", row.names=1,
                    
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o sportnikih na OI 2012...\n")
sportniki <- uvozi2()
sportniki<-sportniki[-c(2:12)]
rownames(sportniki)[72]<-"United Kingdom"
rownames(sportniki)[45]<-"Republic of Congo"
rownames(sportniki)[56]<-"Democratic Republic of the Congo"
rownames(sportniki)[92]<-"Côte d'Ivoire"
rownames(sportniki)[101]<-"Lao PDR"
rownames(sportniki)[136]<-"Dem. Rep. Korea"
rownames(sportniki)[152]<-"Russian Federation"
rownames(sportniki)[170]<-"Republic of Korea"

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.