#installiere ben�tigte Pakete
install.packages ("tidyverse")
install.packages("dplyr")

data1 <- read.csv("Wareneingang.csv", sep = ';') # einlesen der Tabelle und schreibe diese in data1
data1 %>% filter(Art == "Plasmid") #lies data1 und gib alle Zeilen aus die das Wort Plasmid enthalten

data2 <- read.csv("Lagerbestand.csv", sep = ';') #siehe oben
data2 %>% filter(Art == "Plasmid")# siehe oben

#installiere n�tige Pakete
install.packages("quanteda") 
install.packages("tm")
install.packages("stringr")

aText <- readLines("PLA34.txt") #Einlesen der Textdatei
text <- unlist(strsplit(aText, "\\.")) #Teilt den Text in seine S�tze auf
text[grep(pattern = "pBF9343", text, ignore.case = T)] #gibt den Satz zur�ck, welcher das Suchwort enth�lt

bText <- readLines("FERT54.txt")
text <- unlist(strsplit(bText, "\\."))
text[grep(pattern = "F128", text, ignore.case = T)]



# Lade RMySQL-Paket
install.packages("RMySQL")
require(RMySQL)



# Verbinde mit MySQL
connection <- dbConnect(
  MySQL(),
  user = 'pkoehle2',
  password = 'ahwi7Lui',
  host = 'wdb2.hs-mittweida.de',
  client.flag=CLIENT_MULTI_RESULTS
)



# Datenbank ausw�hlen
sql <- "USE pkoehle2"
result <- dbGetQuery(connection , sql)

sql <- "show tables"
sql <- "drop table plasmid"


# Erstelle Tabelle
sql <- "CREATE TABLE plasmid (
Plasmid VARCHAR(10),
Klasse VARCHAR(25),
Gr��e_in_bp INT,
Eingangsdatum DATE,
Experiment VARCHAR(10),
Vorhanden VARCHAR(10))"
dbGetQuery(connection, sql)




# Tabelle einladen
sql <- "LOAD DATA LOCAL INFILE 'plasmid.csv' INTO TABLE plasmid
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES"
dbGetQuery(connection, sql)


#zeige Tabelle
sql <- "SELECT * FROM plasmid"
L�sung <- dbGetQuery(connection, sql)
print(L�sung)


