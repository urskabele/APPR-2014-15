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


#2.) Krivulje, ki se najbolj prilegajo številu dogodkov na poletnih in zimskih OI
attach(OI)
pdf("slike/naprednigrafi.pdf",paper="a4r")


#2.1.)modeli: krivulje za št dogodkov poletnih OI

letop<-OI$Leto[Vrsta=="poletne"] #leta poletnih OI
dogp<-OI$Stevilo.dogodkov[Vrsta=="poletne"] #st dogodkov poletnih OI

   #graf
plot(letop,dogp, xlim=c(1896,2050),ylim=c(0,500),
     xlab="Leto",ylab="Število dogodkov",
     main="Napoved za število dogodkov na poletnih OI",pch=20,col="red",type="p",lwd=3.5)

   #premica
linp<-lm(dogp~letop)
abline(linp,col="green")
   #parabola
kvp<-lm(dogp~I(letop^2)+letop)
curve(predict(kvp, data.frame(letop=x)), add = TRUE, col = "purple")
   #loess
loep<-loess(dogp~letop)
curve(predict(loep, data.frame(letop=x)),add=TRUE,col="orange")
   #legenda
legend("topleft", c("Linerana metoda", "Kvadratna metoda","Loess"),lty=c(1,1,1), col = c("green","purple","orange"))
   #Ocenimo prileganje krivulj tako, da izračunamo vsote kvadratov razdalj od napovedanih do dejanskih vrednosti
ostp<-sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))

#2.2.)modeli: krivulje za št dogodkov zimskih OI

letoz<-OI$Leto[Vrsta=="zimske"] #leta zimskih OI
dogz<-OI$Stevilo.dogodkov[Vrsta=="zimske"] #st dogodkov zimskih OI

   #graf
plot(letoz,dogz,xlim=c(1924,2050),ylim=c(0,200),
     xlab="Leto",ylab="Število dogodkov",
     main="Napoved za število dogodkov na zimskih OI",pch=20,col="blue",type="p",lwd=3.5)
   
   #premica
linz<-lm(dogz~letoz)
abline(linz,col="green")
   #parabola
kvz<-lm(dogz~I(letoz^2)+letoz)
curve(predict(kvz, data.frame(letoz=x)), add = TRUE, col = "purple")
   #loess
loez<-loess(dogz~letoz)
curve(predict(loez, data.frame(letoz=x)),add=TRUE,col="orange")
   #legenda
legend("topleft", c("Linerana metoda", "Kvadratna metoda","Loess"),lty=c(1,1,1), col = c("green","purple","orange"))
   #Ocenimo prileganje krivulj tako, da izračunamo vsote kvadratov razdalj od napovedanih do dejanskih vrednosti
ostz<-sapply(list(linz, kvz, loez), function(x) sum(x$residuals^2))

detach(OI)
dev.off()

