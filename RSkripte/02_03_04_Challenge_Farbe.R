# Titel:  Challenge Farbe
# Datei:  Challenge_Farbe.R

############################################################
# 1. Erstellen eines Vektors y

y <- c(1,2,4,8,16)  
y

############################################################
# 2. Erstellen von Farbpaletten

# Farbnamen
p1 <- c("blue", "green", "red", "yellow", "violet")

# RGB, z.B. im Wertebereich von 0 bis 255
p2 <- c(rgb(0, 0, 255, max = 255), rgb(0, 255, 0, max = 255), 
        rgb(255, 0, 0, max = 255), rgb(255, 255, 0, max = 255), 
        rgb(238, 130, 238, max = 255))

# Hexadezimalcode
p3 <- c("#0000FF","#00FF00","#FF0000","#FFFF00","#EE82EE")


############################################################
# 2. Einfaches Saeulendiagramm mit den Farbpaletten p1, p2, p3

barplot(y, col = p1)
barplot(y, col = p2)
barplot(y, col = p3)

##############################################################
# Environemt leeren
rm(list = ls())  

# Grafiken entfernen
graphics.off()  

# Konsole leeren
cat("\014")  

