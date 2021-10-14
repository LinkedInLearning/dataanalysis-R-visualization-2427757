# Titel:  Erstellen von Histogramme fuer Beispieldaten
# Datei:  Histogramme.R
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

############################################################
# Daten laden
?PlantGrowth
PlantGrowth

############################################################
# QPLOT

# Einfaches Histogramm
qplot(weight, geom = "histogram", bins = 10, data = PlantGrowth)

# Gruppierte Histogramme
qplot(weight, 
      geom = "histogram",
      bins = 10,
      fill = group, 
      data = PlantGrowth)

# Gruppierte Dichteplots
qplot(weight, 
      geom = "density",
      fill = group, 
      data = PlantGrowth)

###############################################################
# GGPLOT2

# Histogramm
PlantGrowth %>%
  ggplot(aes(x = weight, 
             fill = group)) + 
  geom_histogram(binwidth = 0.25, alpha = 0.5, color = "black") +
  theme(legend.position = "bottom")

# Dichteplot
PlantGrowth %>%
  ggplot(aes(x = weight, 
             fill = group)) + 
  geom_density(alpha = 0.5) +
  theme(legend.position = "bottom")

##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  