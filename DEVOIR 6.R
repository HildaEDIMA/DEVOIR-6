#Devoir 6
#Renommer , creer , lab�liser des variables
# 4 Recoder
#5 changer de type
#D�coupage en classe
#Merger

#Renommer variables
colnames(cereales)[4:14] <- c("AutresCereales","Qtty_cons",
                              "Unite_cons","Taille_cons",
                              "AutoCons","AutresProv",
                              "DernierAchat","Qtty_achat",
                              "Unite_achat","Taille_achat",
                              "Value_achat")
View(cereales)
#Creer une variable prix=qtty_achat*value_achat
cereales$prix <- cereales$Qtty_achat * cereales$Value_achat
#Labeliser la variables Taille_cons 0=aucune ,1=faible ,2=moyen , 3=�lev� 7=tr�s �lev�:recoder des variables
table(cereales$Taille_cons)
# D�finition des niveaux de la variable Taille_cons
niveaux <- c("aucune", "faible", "moyen", "�lev�", "tr�s �lev�")
# Conversion de la variable Taille_cons en facteur avec les niveaux sp�cifi�s
cereales$Taille_cons <- factor(cereales$Taille_cons, levels = c(0, 1, 2, 3, 7), labels = niveaux)

#5 changer de type te la variables Qtty_cons initialement en num en type caract�re

# Conversion de la variable Qtty_cons en type caract�re
cereales$Qtty_cons <- as.character(cereales$Qtty_cons)

#D�coupage en classe de la classe Qtty_cons

# Sp�cifier les points de coupure
points_de_coupe <- c(0, 50, 70, 110, 168)

# Labels pour les classes
labels <- c("Tr�s faible", "Faible", "Moyen", "�lev�")

# D�couper la variable Qtty_cons en classes
cereales$Qtty_cons_classe <- cut(cereales$Qtty_cons, breaks = points_de_coupe, labels = labels, include.lowest = TRUE)

#Merger
install.packages("readxl")
# Charger le package readxl
library(readxl)
conversion <- read_excel("C:/Users/DELL/Desktop/Cours R/Table de conversion phase 2.xlsx")
View(conversion)
#Merger les dataframe conversion et cereales
colnames(conversion)[colnames(conversion) == "produitID"] <- "cereales_id"
dataframe_fusion <- merge(conversion, cereales, by = cereales_id)
