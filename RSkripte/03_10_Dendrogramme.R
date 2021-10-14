# Titel:  Dendrogramme fuer Clusteranalysen
# Datei:  Dendrogramm.R
# 
############################################################
# Daten installieren und laden
# Wenn mehrere Pakete gleichzeitig geladen werden sollen,
# empfiehlt sich der Paketmanager "pacman"
if (!require("pacman")) install.packages("pacman")

# Pakete mit p_load von "pacman" laden
pacman::p_load(datasets, pacman, tidyverse)
# pacman: Paketemanager
# tidyverse: Paketelandschaft zum Aufbereiten und Visualisieren von Daten
# browseURL("https://www.tidyverse.org/")

############################################################
# Daten laden
?LifeCycleSavings 
LifeCycleSavings 

df <- LifeCycleSavings %>%
         rownames_to_column() %>% # Zeilennamen sollen eigene Spalte werden
         as_tibble() %>%
         select(country = rowname, sr, pop15, pop75, dpi, ddpi) %>%
         mutate_at(vars(-country), scale) %>%  # Daten standardisieren, sodass Mittelwert = o und Varianz = 1
  print()

############################################################
# Clusteranalyse

# hclust (vom Paket "stats") und agnes (vom Paket "cluster") fuer
# hierarchische Clusteranalysen (vom einzelnen Objekt zu mehreren Gruppen
# bis zu einer einzigen Gruppe);
# diana (vom Paket "diana") arbeitet anders herum (von einer Gruppe bis
# zu den einzelnen Objekten)

browseURL("https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/dist")

# Cluster berechnen
hc <- df %>%   # Daten einsetzen
  dist %>%     # berechne Distanzmatrix (fuer nummerische Datentypen)
  hclust(method = "complete") # berechne hierachische Cluster via Single Linkage


# weitere Distanzverfahren
browseURL("https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/dist")

# weitere Clusterverfahren:
browseURL("https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/hclust")

# Dendrogramm plotten; relative Schriftgroesse durch cex, 
# alle Labels auf gleicher Ebene durch hang = -1
hc %>% plot(labels = df$country, cex = 0.8, hang = -1)

# Anzahl der Gruppen "k" festlegen (z.B. k = 5) und farblich abgrenzen
# Grenzfarben waehlen: border = 1 (schwarz), 2 (rot), 3 (grün), 
# 4 (blau), 5 (hellblau), 6 (violet); auch als Farbpalette c("blue", ...)
hc %>% rect.hclust(k = 5, border = 2:6)

##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  