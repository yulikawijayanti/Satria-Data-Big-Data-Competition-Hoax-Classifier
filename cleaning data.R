getwd()
setwd("D:\\Satria Data\\Project1\\data_text")
rm(list=ls(all=TRUE))

#PREPROCESSING

df = read.csv("data.csv", header=T)
attach(df)
View(df)

#concetenate
df$fitur = paste(judul, narasi, sep = " ")
View(df)

#select kolom
library(dplyr)
df <- df %>% 
  select("label", "fitur")
View(df)

#NORMALIZATION
df$fitur = tolower(df$fitur)
View(df)

library(tm)

#REMOVE NUMBER AND PUNANCTION
df$fitur <- removePunctuation(df$fitur)
df$fitur <- removeNumbers(df$fitur)
View(df)
df$fitur <- gsub("[^A-Za-z]", " ", df$fitur)

#REMOVE MORE SPACE
df$fitur <- gsub("[ ]{2,}", " ", df$fitur)

#REMOVE URL
df$fitur <- gsub(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", " ", df$fitur)

#REMOVE WORD
remove <- c("ya", "nih", "gak", "sih", "yg", "mas", "mbak", "ga", "dr", "tak", "jg", "krn",
           "dll", "lbh", "dg", "pas", "aja")

write.csv(df, file="D:\\Satria Data\\Project1\\data_text\\df_cleaning1.csv", row.names=F)
