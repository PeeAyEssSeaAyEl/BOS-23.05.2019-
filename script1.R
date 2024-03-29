#Laden der Daten
c = read.csv(file = "Koerpergroe�e_in_cm.csv",sep = ";")
d = read.csv(file = "Koerpergroe�e_in_ft.csv" ,sep = ";")


#Anzeigen einzelner Spalten
c$K�rpergr��e
a = c$Geschlecht
a[3]

#Filtern von Daten
subset(c,c$Geschlecht == "f")

#Doppelt vorkommender Zeilen?
duplicated(c)
#Anzeigen der Zeilenn�mmer doppelt vorkommender Zeilen
which(duplicated(c))
#Anzeige des Datensatzes ohne Dopplungen
unique(c)


#Neubennenung von Daten
e = gsub("m","male",c$Geschlecht) 
f = gsub("f","female",e)
f
c$Geschlecht <- NULL
c <- cbind(c, "Geschlecht" = f)
c

#Umrechnung cm in Fu� (1 Fu� = 30,48 cm)
g = round(c$K�rpergr��e / 30.48 ,1)
#Anbinden an Datensatz
c <- cbind(c, "K�rpergr��e(ft)" = g)
c$K�rpergr��e <- NULL
c
d
