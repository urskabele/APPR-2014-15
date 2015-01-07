# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                          "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                          encoding = "Windows-1250")

# #Logični vektor držav iz zemljevida svet, ki so v tabeli sportniki
vekt0<-rownames(sportniki) %in% svet$name_long

#uredimo
m <- match(svet$name_long, rownames(sportniki))
sportniki.svet <- sportniki[m,]

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.drzave<- c()
  manjkajo <- ! nove.drzave %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.drzave[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$OB_UIME)[rank(zemljevid$OB_UIME)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
#druzine <- preuredi(druzine, obcine)



# Izračunamo povprečno velikost družine.
#druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
min.sportniki <- min(sportniki.svet, na.rm=TRUE)
max.sportniki <- max(sportniki.svet, na.rm=TRUE)
povp.sportniki<-sum(sportniki.svet,na.rm=TRUE)/length(sportniki.svet)
norm.sportniki <- (sportniki.svet-min.sportniki)/(max.sportniki-min.sportniki)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid za OI...\n")
pdf("slike/zemljevid.pdf")

n = 100
barve=rgb(1, 0, 0, (1:n)/n)[unlist(1+(n-1)*norm.sportniki)]
#barve = topo.colors(n)[1+(n-1)*(povp.sportniki-min.sportniki)/(max.sportniki-min.sportniki)]
plot(svet, col = barve)
title("Število športnikov iz posameznih držav na OI 2012")
legend("left", legend = round(seq(min.sportniki, max.sportniki, (max.sportniki-min.sportniki)/5)),
       fill = rgb(1, 0, 0, (1:6)/6), bg = "white")
#Oznacimo nekatera mesta
oznake<-data.frame(E = c(76,-74), N = c(60,40))
points(coordinates(oznake),pch=20)

#Imena drzav
#text(oznake)

dev.off()