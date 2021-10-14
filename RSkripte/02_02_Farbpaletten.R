# Titel:  Farbpaletten für R-Grafiken
# Datei:  Farbpaletten.R
# 
############################################################
# Erstellen eines Vektors x

x <- c(50, 33, 22, 15, 7, 4)  

# Standardsaeulendiagramm in R; 
# browseURL("https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/barplot")
barplot(x)           

############################################################
# Integrierte Farbpaletten

?palette  # Informationen über Farbpaletten
palette() # Aktuelle Farbpalette

barplot(x, col = 1:6)                # Nutze aktuelle Farbpalette
barplot(x, col = rainbow(6))         # Regenbogenfarben
barplot(x, col = heat.colors(6))     # "Hitze"-Grafik von gelb bis rot
barplot(x, col = terrain.colors(6))  # von grau bis gruen
barplot(x, col = topo.colors(6))     # Violet/lila bis Ocker
barplot(x, col = cm.colors(6))       # Pink bis blau

#############################################################
# Farbpaletten "colorbrewer" zum Ausprobieren und Herunterladen
browseURL("http://colorbrewer.org/")

# Paket RColorBrewer laden
library(RColorBrewer)

# Informationen zum Paket
?RColorBrewer

# Zeige alle Paletten an
display.brewer.all()  

# FARBVERLAEUFE: Blues, BuGn, BuPu, GnBu, Greens,
# Greys, Oranges, OrRd, PuBu, PuBuGn, PuRd, Purples, RdPu,
# Reds, YlGn, YlGnBu, YlOrBr, YlOrRd
display.brewer.pal(7,"Greens")

# DIVERGENTE PALETTEN: BrBG, PiYG, PRGn, PuOr, RdBu, RdGy,
# RdYlBu, RdYlGn, Spectral
display.brewer.pal(6,"RdYlBu")

# QUALITATIVE PALETTEN (max. Anzahl an Farben): Accent (8), 
# Dark2 (8), Paired (12), Pastel1 (9), Pastel2 (8), 
# Set1 (9), Set2 (8), Set3 (12)
display.brewer.pal(8,"Accent")

barplot(x, col = 1:6)                   # Standardpalette
barplot(x, col = brewer.pal(6,"BuGn"))  # Farbverlauf
barplot(x, col = brewer.pal(6,"PRGn"))  # Divergente Palette
barplot(x, col = brewer.pal(6,"Set1"))  # Qualitative Palette

#############################################################
# Farbpelleten "wesanderson" zum Ausprobieren und Herunterladen

# Informationen 
browseURL("https://github.com/karthik/wesanderson")

# Paket installieren
install.packages("wesanderson")

# Paket laden
library(wesanderson)

# Informationen zum Paket
?wesanderson

# Namen der Paletten
names(wes_palettes)

# Verschiedene Paletten ausprobieren
barplot(x, col = wes_palette("Royal1"))
barplot(x, col = wes_palette("Darjeeling2"))
barplot(x, col = wes_palette("IsleofDogs1"))
barplot(x, col = wes_palette("Moonrise3"))

###########################################################
# Weitere Farbpaletten unter:
# Die Viridis Farbpaletten
browseURL("http://bit.ly/2tFEqKe")  

# Farbpaletten fuer wissenschaftliche Journals und Sci-Fi Themen
browseURL("http://bit.ly/2NXxIpT")

#############################################################
# Farbpaletten selbst generieren

# Paletten mit Hilfe der Farbnamen erstellen
palette1 <- c("navyblue", "orange2", "khaki", "tan")

# Palette mit Hexadezimalcode erstellen
palette2 <- c("#000080", "#FA8072", "#F0E68C", "#EE9A00")

barplot(x, col = palette1)
barplot(x, col = palette2)

##############################################################
# Environemt leeren
rm(list = ls())  

# Pakete aus Global Environmant entfernen
detach(unload = T)  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  


