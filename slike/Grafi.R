pdf("slike/grafi.pdf",paper="a4r")

attach(OI)
#Stevilo udelezenk poletnih OI
plot(OI$Leto[Vrsta=="poletne"],OI$Stevilo.udelezenk[Vrsta=="poletne"],xlab="Leto",ylab="Število udeleženk",main="Število držav udeleženk na poletnih OI",pch=20,col="red",type="l",lwd=3.5)

#Stevilo udelezenk zimskih OI
plot(OI$Leto[Vrsta=="zimske"],OI$Stevilo.udelezenk[Vrsta=="zimske"],xlab="Leto",ylab="Število udeleženk",main="Število držav udeleženk na zimskih OI",pch=20,col="blue",type="l",lwd=3.5)
detach(OI)
dev.off()

