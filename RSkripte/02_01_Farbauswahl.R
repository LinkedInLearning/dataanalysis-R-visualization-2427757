# Titel:  Farbauswahl in R
# Datei:  Farbauswahl.R
# 
############################################################
# Erstellen eines Vektors x

x <- c(50, 33, 22, 15, 7, 4)  

# Standardsaeulendiagramm in R; 
# browseURL("https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/barplot")
barplot(x)                    

##########################################################
# Farben in R

# Farbbezeichnungen fuer 502 verschiedene Farben,
?colors
colors()  # Liste mit Farbbezeichnungen 

# Informationen zu den Farben in R gibt es hier:
browseURL("https://datalab.cc/rcolors")

################################################################
# Farben verwenden

# Farbnamen
barplot(x, col = "navyblue")  
barplot(x, col = "khaki")  

# RGB (red green blue) Tripel als Dezimalbrueche (0.00-1.00)
barplot(x, col = rgb(.00, .00, .50))  # navyblue
barplot(x, col = rgb(.94, .90, .54))  # khaki

# RGB (red green blue) Tripel als ganzzahlige Werte (0-255)
barplot(x, col = rgb(0, 0, 128, max = 255))      # navyblue
barplot(x, col = rgb(240, 230, 140, max = 255))  # khaki

# RGB (red green blue) als Hexadezimalcode
barplot(x, col = "#000080")  # navyblue 
barplot(x, col = "#F0E68C")  # khaki

# Farbindex
barplot(x, col = colors() [491])  # navyblue
barplot(x, col = colors() [382])  # khaki

############################################################
# Grafiken koennen auch unterschiedlich gefaerbt sein;
# Erstellen eines Farbvektors; Farben wiederholen sich:
barplot(x, col = c("navyblue", "khaki"))
barplot(x, col = c("#000080", "#F0E68C"))

##############################################################
# Environemt leeren
rm(list = ls())  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  


