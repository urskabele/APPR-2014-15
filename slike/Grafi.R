pdf("slike/grafi.pdf",paper="a4r")

#Graf prikazuje stevilo udelezenk OI
plot(OI[,3],xlab="Leto",ylab="Število udeleženk",main="Število držav udeleženk na OI",col="red")


dev.off()