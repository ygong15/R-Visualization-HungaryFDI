##############
# Hungary Investment Visualization
# 07/21/2022
# yuchengo@usc.edu
##############

# prep work
setwd("/Users/ag0115/Desktop/R Data Science Training")
library(tidyverse)
library(ggplot2)
rm(list = ls())

# import data
load("/Volumes/GoogleDrive/.shortcut-targets-by-id/1UyMOhwgjlYS74ur5GwSuuCvfm3H6gWvw/NATO quant/data/Copy of master_ipe_v5_070122_DN+AG.RDATA")
ipe_v5 <- relocate(ipe_v5, fdidollars_WDI, everything())
newDat <- ipe_v5 %>% 
  subset(country %in% c("Hungary")) %>% 
  subset(year>1985)

datCleaned <- dat %>% 
  pivot_longer(names_to = "year", values_to = "Direct_Foreign_Investment", cols=-c(1,2,3,4))

#########
newPlot <- ggplot(data = subset(newDat, year %in% c(1989:2004)),aes(x=factor(year), y = fdidollars_WDI, fill=factor(ifelse(year>1994,"After NATO base in Hungary","Previous Years"))))+
  geom_bar(stat="identity") +
  labs(title = "Direct Foreign Investment In Hungary From Year 1989-2004",
       subtitle = "Data Source: SPEC Lab--master_ipe_v5_070122",
       x = "Year",
       y = "Direct Foreign Investment")+
  scale_fill_manual(name = "", values=c("red","steelblue"))+
  scale_y_continuous(labels = scales::comma)
newPlot 

ggsave("Hungary Direct Foreign investment.png", width=10, height=8, dpi=400, newPlot)



