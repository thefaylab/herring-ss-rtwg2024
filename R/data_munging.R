
### catch data

oldcatch <- read.table("Run23Herring/data_file.ss", skip=31,
                       nrow=101,
                       header=FALSE)

library(r4ss)
library(tidyverse)

dat <- SS_readdat("Run23Herring/data_file.ss")

dat$catch


newdat <- as.tibble(dat$catch) %>%
          group_by(year,seas) %>%
          gather(key="fleet",value="catch",1:6)
fleetnames <- unique(newdat$fleet)
newdat <- newdat %>%
          mutate(fleet2 = match(fleet,fleetnames)) %>%
          mutate(SE = 0.01) %>%
          select(year,seas,fleet2,catch,SE) %>%
          filter(catch>0)

write.table(newdat,file='catch.out',row.names=FALSE,col.names = F)

cpue <- as.tibble(dat$CPUE) %>%
        mutate(month = ifelse(seas==1,3,9)) %>%
        select(year,month,index,obs,se_log)

write.table(cpue,file='cpue.out',row.names=FALSE,col.names = F)
  

lencomp <- as.tibble(dat$lencomp) %>%
  mutate(month = ifelse(Seas==1,3,9)) %>%
  select(-Seas) %>%
  select(Yr,month,everything())

write.table(lencomp,file='lencomp.out',row.names=FALSE,col.names = F)
write.table(t(c(-9999,rep(0,ncol(lencomp)-1))),file='lencomp.out',
            row.names = F, col.names = F,
            append = TRUE)

agecomp <- as.tibble(dat$agecomp) %>%
  mutate(month = ifelse(Seas==1,3,9)) %>%
  select(-Seas) %>%
  select(Yr,month,everything())

write.table(agecomp,file='agecomp.out',row.names=FALSE,col.names = F)
write.table(t(c(-9999,rep(0,ncol(agecomp)-1))),file='agecomp.out',
            row.names = F, col.names = F,
            append = TRUE)

##### 2018/3/8, GF
##### convert new data tables to SS3.3 format


catch <- read_csv("InputData/CommercialCatch.csv")
fleetnames <- colnames(catch)[1:8]
nfleet <- length(fleetnames)
#_fleet_type timing area units need_catch_mult fleetname
#1 -1 1 1 0 MobS1mixgom  # 1

#Fleet setup

areas <- sapply(fleetnames,
       function(x) as.numeric(substr(x,nchar(x),nchar(x)),drop=TRUE))

fleet_setup <- as.data.frame(list(type=rep(1,nfleet),
                                  timing=rep(-1,nfleet),
                                  area=areas,
                                  units=rep(1,nfleet),
                                  mult = rep(0,nfleet),
                                  fleet = fleetnames))

write.table(fleet_setup,file='catch.out',row.names=FALSE,col.names = FALSE, 
            quote = FALSE)

### CATCH DATA

newdat <- as.tibble(catch) %>%
  rename(year = YEAR, seas = SEASON) %>%
  group_by(year,seas) %>%
  gather(key="fleet",value="catch",1:nfleet)
#fleetnames <- unique(newdat$fleet)
newdat <- newdat %>%
  mutate(fleet2 = match(fleet,fleetnames)) %>%
  mutate(SE = 0.01) %>%
  mutate(cat2 = round(catch,digits=2)) %>%
  select(year,seas,fleet2,cat2,SE) %>%
  #select(year,seas,fleet,catch,SE) %>%
  rename(catch = cat2) %>%
  filter(catch>0)

write.table(newdat,file='catch.out', row.names=FALSE, col.names = FALSE, 
            append = TRUE)

### Indices

cpue <- read_csv("InputData/Indices.csv") %>%
  mutate(month = ifelse(Seas==1,3.5,9.5)) %>%
  mutate(obs2 = round(obs,digits=3)) %>%
  mutate(err2 = round(err,digits=3)) %>%
  select(Yr,month,Flt,obs2,err2)

write.table(cpue,file='cpue.out',row.names=FALSE,col.names = F)


## Length Comp
fleetnames2 <- sapply(fleetnames,
                function(x) as.character(substr(x,1,nchar(x)-1),drop=TRUE))
fixed <- grep("FIXED",fleetnames2)
fleetnames3 <- fleetnames2
fleetnames3[fixed] <- gsub("FIXED","",fleetnames2[fixed])
fleetnames3[fixed] <- paste0("FIXED",fleetnames3[fixed])
fleetnames3[-fixed] <- gsub("MOBILE","",fleetnames2[-fixed])
fleetnames3[-fixed] <- paste0("MOBILE",fleetnames3[-fixed])


lencomp <- read_csv("InputData/CommercialLenComp.csv") %>%
  mutate(month = ifelse(Seas==1,3.5,9.5)) %>%
  mutate(fleet = match(Flt,fleetnames3)) %>%
  select(-Seas) %>%
  select(-Flt) %>%
  select(Yr,month,fleet,everything())

write.table(lencomp,file='lencomp.out',row.names=FALSE,col.names = F)

survlencomp <- read_csv("InputData/SurveyLenComp.csv") %>%
  mutate(month = ifelse(Seas==1,3.5,9.5)) %>%
  select(-Seas) %>%
  select(Yr,month,Flt,everything())

write.table(survlencomp,file='lencomp.out',row.names=FALSE,col.names = F,
            append = TRUE)

write.table(t(c(-9999,rep(0,ncol(lencomp)-1))),file='lencomp.out',
            row.names = F, col.names = F,
            append = TRUE)


## Age Comp

agecomp <- read_csv("InputData/CommercialAgeatLenComp.csv") %>%
  mutate(month = ifelse(Seas==1,3.5,9.5)) %>%
  mutate(fleet = match(Flt,fleetnames3)) %>%
  select(-Seas) %>%
  select(-Flt) %>%
  select(YEAR,month,fleet,everything())

write.table(agecomp,file='agecomp.out',row.names=FALSE,col.names = F)

survagecomp <- read_csv("InputData/SurveyAgeatLen.csv") %>%
  mutate(month = ifelse(Seas==1,3.5,9.5)) %>%
  #mutate(fleet = match(Flt,fleetnames3)) %>%
  select(-Seas) %>%
  #select(-Flt) %>%
  select(YEAR,month,Flt,everything())

write.table(survagecomp,file='agecomp.out',row.names=FALSE,col.names = F,
            append = TRUE)

write.table(t(c(-9999,rep(0,ncol(agecomp)-1))),file='agecomp.out',
            row.names = F, col.names = F,
            append = TRUE)
