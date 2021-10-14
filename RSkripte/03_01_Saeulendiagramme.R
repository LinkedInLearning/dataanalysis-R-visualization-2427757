# Titel:  Standardsaeulendiagramme in R
# Datei:  Standardsaeulendiagramme.R
# 
############################################################
# Daten installieren und laden
# Wenn mehrere Pakete gleichzeitig geladen werden sollen,
# empfiehlt sich der Paketmanager "pacman"
if (!require("pacman")) install.packages("pacman")

# Pakete mit p_load von "pacman" laden
pacman::p_load(datasets, pacman, tidyverse)
# datasets: enthaelt etliche Beispieldatensaetze
# pacman: Paketemanager
# tidyverse: Paketelandschaft zum Aufbereiten und Visualisieren von Daten
# browseURL("https://www.tidyverse.org/")

?Titanic
Titanic

df <- Titanic %>%                     # Datensatz in mehreren Tabellen
          as_tibble() %>%             # Konvertiere in ein Tibble (besserer Dataframe)
          uncount(n) %>%              # Generiere fuer jede Person eine eigene Zeile
          mutate_all(as_factor) %>%   # Alle Variablen werden zu "factors", denn sie sind kategoriale Variablen
          mutate(Class = factor(Class, 
                                levels = c("1st","2nd","3rd","Crew")))%>% # aendere die Reihenfolge der Levels bei der Darstellung im Diagramm 
      print()                         # gib erste 10 Zeilen aus

##############################################################
# Generiere Saeulendiagramme mit Standardfunktion plot()
df %>%
  select(Class) %>%
  plot()

df %>%
  select(Sex) %>%
  plot()

df %>%
  select(Age) %>%
  plot()

#############################################################
# Verwende qplot() fuer detailiertere Saeulendiagramme

qplot(Class, data = df)
qplot(Sex, data = df)
qplot(Age, data = df)

#############################################################
##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  


