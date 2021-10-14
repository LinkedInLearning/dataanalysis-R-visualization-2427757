# Titel:  Gruppenspezifische Grafiken
# Datei:  GruppenSpezGrafiken.R
# 
############################################################
# Daten installieren und laden
# Wenn mehrere Pakete gleichzeitig geladen werden sollen,
# empfiehlt sich der Paketmanager "pacman"
# Installation des Paketes "car", es enthaelt den Highway MPG Datasatz.
if (!require("pacman")) install.packages("pacman", "car")

# Pakete mit p_load von "pacman" laden
pacman::p_load(car, pacman, tidyverse)
# pacman: Paketemanager
# tidyverse: Paketelandschaft zum Aufbereiten und Visualisieren von Daten
# browseURL("https://www.tidyverse.org/")

############################################################
# Highway MPG Datasatz laden

?mpg

# Speichere Datensatz unter df und wandle alle Character in Factor um.
df <- mpg %>% 
        mutate_if(is.character, as.factor) %>%
      print()

summary(df)
############################################################
# Histogramme 

# Ein Histogramm fuer alle Gruppen;
# Gruppen werden nur farblich getrennt.
df %>%
  ggplot(aes(x = displ, 
             fill = drv)) + 
  geom_histogram(bins = 30) +
  theme(legend.position = "bottom")

# Für jede Gruppe ein eigenes Histogramm.
df %>%
  ggplot(aes(x = displ, 
             fill =drv)) + 
  geom_histogram(bins = 30) +
  facet_grid(drv ~ .) +            # je Gruppe eine Grafik
  theme(legend.position = "none")  # Legende ausblenden

############################################################
# Dichteplots

# Ein Dichteplot fuer alle Gruppen;
# Gruppen werden nur farblich getrennt.
df %>%
  ggplot(aes(x = displ, 
             fill = drv)) + 
  geom_density(alpha = 0.5) +
  theme(legend.position = "bottom")

# Für jede Gruppe ein eigenen Dichteplot.
df %>%
  ggplot(aes(x = displ, 
             fill = drv)) + 
  geom_density(alpha = 0.5) +
  facet_grid(drv ~ .) +            # je Gruppe eine Grafik
  theme(legend.position = "none")  # Unterdrücken der Legende

############################################################
# Streudiagramme

# Ein Streudiagramm fuer alle Gruppen;
# Gruppen werden nur farblich getrennt.
df %>% 
  ggplot(aes(displ, hwy,
           color = drv)) +
  geom_point(size = 2) +
  geom_smooth(method = lm, formula = y ~ x) +
  theme(legend.position = "bottom")

# Für jede Gruppe ein eigenes Streudiagramm.
ggplot(df, 
       aes(displ, hwy,
           color = drv)) +
  geom_point(size = 2) +
  geom_smooth(method = lm, formula = y ~ x) +
  facet_grid(drv ~ .) +             # je Gruppe eine Grafik
  theme(legend.position = "none")   # Unterdrücken der Legende

##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  