# Titel:  Erstellen von Box plots
# Datei:  Boxplots.R
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
# Einfache Box Plots

# Alle Variablen in einer Grafik.
PlantGrowth %>% boxplot()

# Eine Variable ohne Differenzierung der Gruppen.
PlantGrowth %>% 
  select(weight) %>%
  boxplot(horizontal = T)

# Eine Variable mit Differenzierung der Gruppen.
boxplot(weight ~ group, 
        data = PlantGrowth,
        horizontal = T)

###########################################################
# QPLOT()

# Einfacher Punkteplot, Differenzierung nach Grupppe.
qplot(group, weight, data = PlantGrowth)

# Farbiger Punkteplot, Differenzierung nach Gruppe.
qplot(group, 
      weight, 
      col  = group, 
      data = PlantGrowth)

#  Farbiger Punkte - und Box Plot, Differenzierung nach Gruppe.
qplot(group, 
      weight, 
      col  = group, 
      geom = c("boxplot", "jitter"), 
      data = PlantGrowth)

# Nur Box Plot; ohne Streuung der Punkte, Differenzierung nach Gruppe.
qplot(group, 
      weight, 
      col  = group, 
      geom = c("boxplot"), 
      data = PlantGrowth)

################################################################
# GGPLOT2()

# Box Plot fuer eine Variable, Differenzierung nach Gruppe.
PlantGrowth %>%
  ggplot(aes(x = group, 
             y = weight, 
             fill = group)) + 
  geom_boxplot() +
  coord_flip() +
  xlab("") +
  theme(legend.position = "none")

##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  