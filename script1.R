#Laden der Daten
c = read.csv(file = "Koerpergroeße_in_cm.csv",sep = ";")
d = read.csv(file = "Koerpergroeße_in_ft.csv" ,sep = ";")


#Anzeigen einzelner Spalten
c$Körpergröße
a = c$Geschlecht
a[3]

#Filtern von Daten
subset(c,c$Geschlecht == "f")

#Doppelt vorkommender Zeilen?
duplicated(c)
#Anzeigen der Zeilennümmer doppelt vorkommender Zeilen
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

#Umrechnung cm in Fuß (1 Fuß = 30,48 cm)
g = round(c$Körpergröße / 30.48 ,1)
#Anbinden an Datensatz
c <- cbind(c, "Körpergröße(ft)" = g)
c$Körpergröße <- NULL
c
d
