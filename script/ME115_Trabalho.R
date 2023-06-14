##Trabalho ME115

#Análise exploratória de dados

library(tidyverse)
library(readr)

# 1. Leitura dos Dados
url <- "https://raw.githubusercontent.com/eduardoneres/-ME115---CRAB/main/dados/train_extended.csv"
df <- read_csv(url)
head(df)

#2. Limpeza de Dados
colnames(credits)
colnames(movies)

## Mudança de nome das colunas
novo_nome <- c("id", "sexo", "comprimento", "diametro", "altura", "peso", "peso_descascado",
               "peso_visceral", "peso_carapaca", "idade" )
colnames(df)<- novo_nome
View(df)

##Conversão de unidade de medida
libra_kg <- 0.453592   #conversão de libra para quilos
pes_cm <- 30.48        #conversão de pés para centimetros
df2 <- df %>% mutate(comprimento = comprimento*pes_cm, diametro = diametro*pes_cm,
                     altura = altura*pes_cm, peso = peso*libra_kg, peso_descascado = peso_descascado*libra_kg,
                     peso_visceral = peso_visceral*libra_kg, peso_carapaca = peso_carapaca*libra_kg)
df2

##Verificação de  linhas duplicadas
which(duplicated(df2))             #verificação de todo o dataset
df3 <- unique(df2)
which(duplicated(df2$id))          #verificação somente do id

##Verificação de classe
str(df2)

##Verificação de ruídos nos dados
linha <- df2 %>% filter(sexo != "M" & sexo != "F" & sexo != "I")
#df3  <- df2  %>% filter(id != linha$id) #Resolver se vai excluir ou mudar o id

#

