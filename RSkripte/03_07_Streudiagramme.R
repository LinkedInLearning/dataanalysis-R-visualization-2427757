# Titel:  Erstellen von Streudiagramme
# Datei:  Streudiagramme.R
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

# Abalone - Datensatz
# Informationen unter: 
browseURL("https://archive.ics.uci.edu/ml/datasets/Abalone")

# Importieren der Daten mit readr::read_csv() von tidyverse
# und Aufbereiten (zusaetzliche "Group"- Variable generieren)
df <- read_csv("Daten/abalone.data") %>%
          mutate(Group =
                   ifelse(Sex == "F" | Sex == "M", "A", "I")) %>%
          mutate(Group = as.factor(Group)) %>%
        print()

summary(df)
############################################################
# QPLOT

# Einfaches Streudiagramm fuer die Variablen "Length" und "Whole" 
qplot(Whole, Length, data = df)

# Streudiagramm fuer die Variablen "Length" und "Whole"
# Gruppiert nach der Gruppe "Sex"
# Groesse der Punkte nach "Diam"
qplot(Whole,
      Length, 
      color = Group, 
      data = df) 

############################################################
# GGPLOT2
browseURL("https://ggplot2.tidyverse.org/reference/geom_point.html")

# Standardstreudiagramm
ggplot(df, 
       aes(Whole, Length, color = Group)) +
  geom_point()

#alternativ: 
ggplot(df)  +
  geom_point(aes(Whole, Length, color = Group))

# Streudiagramm (jittered) unter Berücksichtigung von
# Variablengroesse, Farbe nach Gruppe (hier Variable "Group").
ggplot(df, 
       aes(Whole, Length,
           size  = Diam, 
           color = Group)) +
  geom_jitter(alpha = .3)


##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
p_unload(all)  #Befehl erfordert Paket "pacman"  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  
