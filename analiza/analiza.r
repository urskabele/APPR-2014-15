# 4. faza: Analiza podatkov

## Uvozimo funkcijo za uvoz spletne strani.
#source("lib/xml.r")

# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()


#1.) Normiran zemljevid Števila športnikov iz posameznih držav na OI 2012

#najprej izračunamo vektor ki vsebuje podatek o športnikih/število prebivalcev
nn<-sportniki*1000000 #število športnikov pomnoženo z 10^6, da vsa števila v legendi niso enaka 0
pop<-svet$pop_est #populacija, podatki iz zemljevida svet

#uredimo
l <- match(svet$name_long, rownames(nn))
norm.sp.svet <- nn[l,]

podatki.za.norm.zemlj<-norm.sp.svet/pop #podatki ki jih bomo uporabili za zemljevid


# Izračunamo max, min, povprečje
#druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
min.norm <- min(podatki.za.norm.zemlj, na.rm=TRUE)
max.norm <- max(podatki.za.norm.zemlj, na.rm=TRUE)
povp.norm<-sum(podatki.za.norm.zemlj,na.rm=TRUE)/length(podatki.za.norm.zemlj)
norm.norm <- (podatki.za.norm.zemlj-min.norm)/(max.norm-min.norm)

# Narišimo zemljevid v PDF.
cat("Rišem normiran zemljevid za OI...\n")
pdf("slike/normiranzemljevid.pdf")

n = 100
barve.norm=rgb(0, 0, 1, (1:n)/n)[unlist(1+(n-1)*norm.norm)]

plot(svet, col = barve.norm)

#naslov
title("Št. športnikov na milijon prebivalcev iz posameznih držav na OI 2012")
#legenda
legend("left", legend = round(seq(min.norm, max.norm, (max.norm-min.norm)/5)),
       fill = rgb(0, 0, 1, (1:6)/6), bg = "white")


#Dodamo imena drzav
#najprej poberemo iz zemljevida svet tiste države ki bi jih radi označili
oznacene<-svet[c(9,23,28,31,136,169),]
#dodamo imena na zemljevid
text(coordinates(oznacene),labels=c("Avstralija","Brazilija","Kanada","Kitajska","Rusija","ZDA"),cex=0.55,col="black")

dev.off()
