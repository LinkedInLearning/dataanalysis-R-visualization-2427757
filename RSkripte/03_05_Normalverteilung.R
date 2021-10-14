# Titel:  Dichteplots und Histogramme generierter normalverteilter Daten
# Datei:  Normalverteilung.R
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

#############################################################
# Erstellen der Wahrscheinlichkeitsdichtefunktion
# fuer die Standardnormalverteilung

# Wertebereich festlegen
p <- ggplot(data.frame(x = c(-4, 4)), aes(x = x))

# Statistische Funktion hineinlegen ("dnorm" fuer die 
# Wahrscheinlichkeitsdichtefunktion der Standardnormalverteilung)
p + stat_function(fun = dnorm, 
                  size  = 2,                  # Linienstaerke
                  color = "lightblue3") +     # Farbe
    xlab("z-Werte") +                         # x-Achsenbeschriftung  
    ylab("Relative Haeufigkeit")              # y-Achsenbeschriftung

# Histogramm fuer Standardnormalverteilung zeichnen
x <- rnorm(10000) # Vektor mit 10 000 standardnormalverteilten Zufallszahlen

# Histogramm zeichnen
ggplot(NULL, aes(x = x)) + 
  geom_histogram(binwidth = 0.3,          # Klassenbreite
                 fill  = "lightblue3", 
                 color = "white") +
  xlab("z-scores") +  
  ylab("Haeufigkeit") 


##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  
