# Titel:  Saeulendiagramme mit ggplot2
# Datei:  Saeulendiagramme_ggplot2.R
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

df <- Titanic %>%                           # Datensatz in mehreren Tabellen
        as_tibble() %>%                     # Konvertiere in ein Tibble (besserer Dataframe)
        uncount(n) %>%                      # Generiere fuer jede Person eine eigene Zeile
        mutate_all(as_factor) %>%           # Alle Variablen werden zu "factors", denn sie sind kategoriale Variablen
        mutate(Class = factor(Class, 
               levels = c("1st","2nd","3rd","Crew")))%>% # aendere die Reihenfolge der Levels bei der Darstellung im Diagramm 
      print()                               # gib erste 10 Zeilen aus


#############################################################
# Verwende tidyverse-Paket "ggplot2"
browseURL("https://ggplot2.tidyverse.org/index.html")

# Ausfuehrung in zwei Schritte
g <- df %>% ggplot(aes(Class))  # Was soll gezeigt werden?
g

g + geom_bar()                  # Wie soll es gezeigt werden? Als Saeulendiagramm ...

# Grafik g aufbereiten
g + 
  geom_bar(fill = "lightblue3") +  # Waehle Farbe: lightblue3
  theme_minimal() +                # theme - Auswahl; theme_minimal laesst Hintergrund verschwinden
  coord_flip() +                   # Diagramm drehen
  labs(                            # Hinzufuegen von Titels und Labels
    title    = "Personengruppen auf der Titanic", 
    subtitle = "2201 Personen",
    caption  = "(Quelle: Titanic - Datensatz)",
    y        = "Personenzahl",
    x        = NULL)

##############################################################
# Grafiken speichern

# Grafik als PNG im Ordner Output speichern
ggsave("Output/barchart.png",
       width = 4, height = 3)

# Grafik als PDF im Ordner Output speichern
ggsave("Output/barchart.pdf",
       width = 4, height = 3, dpi = 300)

############################################################
# Gruppierte Saeulendiagramme

# Anzahl in Gruppen "survived = yes" und "survived = no" 
# pro Klasse als Sauelen dargestellt
df %>%
  ggplot(aes(Class, fill = Survived)) + 
  geom_bar(position = position_dodge()) + #position = position_dodge(): Saeulen sollen nebeneinander stehen
  theme(legend.position = "bottom")

# Gestappeltes Saeulendiagramm
df %>%
  ggplot(aes(Class, fill = Survived)) + 
  geom_bar()

# Gestappeltes Saeulendiagramm mit Anteilen 
# bzw. rel. Haeufigkeiten
df %>%
  ggplot(aes(Class, fill = Survived)) + 
  geom_bar(position = "fill")

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


