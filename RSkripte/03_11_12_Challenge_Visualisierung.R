# Titel:  Challenge Visualisierung
# Datei:  Challenge_Visualisierung.R
# 
##############################################################################
# 1. Daten installieren und laden
# Wenn mehrere Pakete gleichzeitig geladen werden sollen,
# empfiehlt sich der Paketmanager "pacman"
if (!require("pacman")) install.packages("pacman")

# Pakete mit p_load von "pacman" laden
pacman::p_load(datasets, pacman, tidyverse)
# datasets: enthaelt Beispieldatensaetze
# pacman: Paketemanager
# tidyverse: Paketelandschaft zum Aufbereiten und Visualisieren von Daten
# browseURL("https://www.tidyverse.org/")


##############################################################################
?datasets
library(help = "datasets")

# 2. Datensatz laden
ChickWeight 
?ChickWeight 

# 3. Boxplot, Differenzierung nach Gruppe 
ggplot(ChickWeight , aes(x=Diet, y=weight, fill=Diet)) +
  geom_boxplot() +
  ggtitle('Points by Diet') 

# 4. Je Gruppe ein eigener Boxplot
ggplot(ChickWeight , aes(x=Diet, y=weight, fill=Diet)) +
  geom_boxplot() +
  facet_grid(Diet ~ .) + 
  ggtitle('Points by Diet')


##############################################################################
# ZUSATZ######################################################################
# 3. Streudiagramm, Differenzierung nach Gruppe 
ggplot(ChickWeight, 
       aes(Time, weight,
           color = Diet)) +
  geom_point(size = 1.5) +
  geom_smooth(method = lm, formula = y ~ x)

# 4. Je Gruppe ein eigenes Streudiagramm
ggplot(ChickWeight, 
       aes(Time, weight,
           color = Diet)) +
  geom_point(size = 1.5) +
  facet_grid(Diet ~ .) + 
  geom_smooth(method = lm, formula = y ~ x)


##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  

