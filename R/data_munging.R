
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

