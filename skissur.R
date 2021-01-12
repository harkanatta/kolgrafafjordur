library(DT)
library(tidyverse)

stodvar <- read.csv("skjol/stodvar.csv",header = T,encoding = "UTF-8",row.names = NULL)
rass <- make.names(stodvar[, 1], unique=TRUE)
stodvar <- stodvar[, -1]

stodvar <- stodvar %>% 
  mutate_all(~na_if(., '#VALUE!')) %>% replace(is.na(.), 0) 

rownames(stodvar) <- rass[as.numeric(rownames(stodvar))]

stodvar <- stodvar %>% 
  filter_all(any_vars(. != 0)) #%>% 
  #mutate_if(is.character,as.integer)
str(stodvar)



DT::datatable(stodvar,rownames = T)




stodvar <- read.csv("skjol/stod2015.csv",header = T,encoding = "UTF-8",row.names = NULL)
rass <- make.names(stodvar[, 1], unique=TRUE)
stodvar <- stodvar[, -1]
stodvar <- stodvar %>% filter_all(any_vars(. != 0))
str(stodvar)

rownames(stodvar) <- rass[as.numeric(rownames(stodvar))] #bull
DT::datatable(stodvar,rownames = T)
