# Uvoz s spletne strani

library(XML)

# Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# iz vozlišč, ki ustrezajo podani poti.
stripByPath <- function(x, path) {
  unlist(xpathApply(x, path,
                    function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
}

uvozi.tabela <- function() {
  url.tabela <- "http://en.wikipedia.org/wiki/List_of_Olympic_Games_host_cities"
  doc.tabela <- htmlTreeParse(url.tabela, useInternalNodes=TRUE)
  
  # Poiščemo vse tabele v dokumentu
  tabele <- getNodeSet(doc.tabela, "//table")
  
  # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
  # trenutnim vozliščem
  vrstice <- getNodeSet(tabele[[1]], "./tr")
  
  # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
  # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
  seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
  
  # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
  # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
  seznam <- lapply(seznam, function(x)
    if (length(x) == 9) {
      return(x)
    } else {
      return(c(x, ""))
    })

  # Iz seznama vrstic naredimo matriko
  matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
  
  # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
  colnames(matrika) <- gsub("\n", " ", stripByPath(tabele[[1]][[1]], ".//th"))
  
  # Podatke iz matrike spravimo v razpredelnico
  tabela <- data.frame(gsub("\\[.*$", "", matrika), stringsAsFactors=FALSE)
  tabela$Year <- as.numeric(as.character(tabela$Year))
  row.names(tabela) <- ifelse(tabela$Summer == "—", tabela$Winter, tabela$Summer)
  tabela<-tabela[,-(4:5)]
  return(tabela)
}
