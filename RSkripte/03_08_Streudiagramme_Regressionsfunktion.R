# Titel:  Streudiagramme mit gefitteter Regressionsfunktion
# Datei:  Streudiagramme_Regressionsfunktion.R
# 
############################################################
# Daten installieren und laden
# Wenn mehrere Pakete gleichzeitig geladen werden sollen,
# empfiehlt sich der Paketmanager "pacman"
if (!require("pacman")) install.packages("pacman")

# Pakete mit p_load von "pacman" laden
pacman::p_load(pacman, tidyverse)
# pacman: Paketemanager
# tidyverse: Paketelandschaft zum Aufbereiten und Visualisieren von Daten
# browseURL("https://www.tidyverse.org/")

############################################################
# Daten laden
# Importieren der Daten mit readr::read_csv() von tidyverse
# und Aufbereiten (zusaetzliche "Group"- Variable generieren)
df <- read_csv("Daten/abalone.data") %>%
  mutate(Group =
           ifelse(Sex == "F" | Sex == "M", "A", "I")) %>%
  mutate(Group = as.factor(Group)) %>%
  print()


summary(df)


############################################################
# GGPLOT2: Streudiagramm ohne Regressionsfunktion

ggplot(df, 
       aes(Whole, Length)) +
  geom_point(size = 1.5)


# GGPLOT2: Streudiagramm mit Regressionsfunktion
# Regressionsfunktion je Gruppe (y ~ x). 
ggplot(df, 
       aes(Whole, Length, color = Group)) +
  geom_point(size = 1.5) +
  geom_smooth(method = lm, formula = y ~ x)

# Streudigramm, Farbe nach Gruppe, 
# angepasste Regressionsfunktion je Gruppe (y ~ log (x)).
ggplot(df, 
       aes(Whole, Length,
           color = Group)) +
  geom_point(size = 1.5) +
  geom_smooth(method = lm, formula = y ~ log(x))

# Polynomfunktion mit method = loess je Gruppe,
# Konvidenzintervall mit level festlegen (Standard: level = 0.95).
ggplot(df, 
       aes(Whole, Length,
           color = Group)) +
  geom_point(size = 1.5) +
  geom_smooth(method=loess, level=0.99)


# Infos zu geom_smooth
browseURL("https://ggplot2.tidyverse.org/reference/geom_smooth.html")

##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  
