
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
#####################################
## removing 2016 old data and inputting new 2016 and 2017 data
## AEW and ARH
## 3/22/2018


old_catch <- read.csv("InputData/CommercialCatch.csv")
old_catch <- old_catch[-105:-106,]

new_catch <- read.csv("InputData/CommercialCatch_16_17.csv")
catch <- rbind(old_catch, new_catch)
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
#add seasons back
fleetnames3 <- paste0(fleetnames3,rep(1:2,4))




old_lencomp <- read_csv("InputData/CommercialLenComp.csv") %>%
  filter(Yr != 2016) 
new_lencomp <- read_csv("InputData/CommercialLenComp_16_17.csv")
lencomp <- rbind(old_lencomp, new_lencomp) %>%
  mutate(Flt2 = paste0(Flt,Seas)) %>%  
  mutate(month = ifelse(Seas==1,4,10)) %>%
  mutate(fleet = match(Flt2,fleetnames3)) %>%
  select(-Seas) %>%
  select(-Flt) %>%
  select(-Flt2) %>%
  select(Yr,month,fleet,everything())


write.table(lencomp,file='lencomp.out',row.names=FALSE,col.names = F)

survlencomp <- read_csv("InputData/SurveyLenComp.csv") %>%
  mutate(month = ifelse(Seas==1,4,10)) %>%
  select(-Seas) %>%
  select(Yr,month,Flt,everything())

write.table(survlencomp,file='lencomp.out',row.names=FALSE,col.names = F,
            append = TRUE)

write.table(t(c(-9999,rep(0,ncol(lencomp)-1))),file='lencomp.out',
            row.names = F, col.names = F,
            append = TRUE)


## Age Comp

old_agecomp <- read_csv("InputData/CommercialAgeatLenComp.csv") %>%
  filter(YEAR != 2016) %>%
  mutate(Flt2 = paste0(Flt,Seas)) %>%  
  mutate(month = ifelse(Seas==1,4,10)) %>%
  mutate(fleet = match(Flt2,fleetnames3)) %>%
  select(-Seas) %>%
  select(-Flt) %>%
  select(-Flt2) %>%
  select(YEAR,month,fleet,everything())

new_agecomp <- read_csv("InputData/CommercialAgeatLenComp_16_17.csv") %>%
  mutate(month = ifelse(Seas==1,4,10)) %>%
  mutate(Flt2 = paste0(Flt,Seas)) %>%  
  mutate(fleet = match(Flt2,fleetnames3)) %>%
  select(-Seas) %>%
  select(-Flt) %>%
  select(-Flt2) %>%
  select(YEAR,month,fleet,everything())

agecomp <- rbind(old_agecomp, new_agecomp)
write.table(agecomp,file='agecomp.out',row.names=FALSE,col.names = F)

survagecomp <- read_csv("InputData/SurveyAgeatLen.csv") %>%
  mutate(month = ifelse(Seas==1,4,10)) %>%
  #mutate(fleet = match(Flt,fleetnames3)) %>%
  select(-Seas) %>%
  #select(-Flt) %>%
  select(YEAR,month,Flt,everything())

write.table(survagecomp,file='agecomp.out',row.names=FALSE,col.names = F,
            append = TRUE)

write.table(t(c(-9999,rep(0,ncol(agecomp)-1))),file='agecomp.out',
            row.names = F, col.names = F,
            append = TRUE)


#### Food habits data ####
#### 4/5/18  GF ####
## going to be fleet 14
# index value
foodindex <- read_csv("InputData/Indices_food.csv") %>%
  mutate(month = ifelse(Seas==1,4,10)) %>%
  mutate(obs2 = round(obs,digits=3)) %>%
  mutate(err2 = round(err,digits=3)) %>%
  mutate(fleet = rep(14,nrow(foodindex))) %>%
  select(Yr,month,fleet,obs2,err2)
foodindex
write.table(foodindex,file='foodindex.out',row.names=FALSE,col.names = F)

# length compositions

food_lencomp <- read_csv("InputData/FoodHabitSurveyLenComp.csv")
colnames(food_lencomp) <- c("Yr","Seas","Flt",4:ncol(food_lencomp))

food_lencomp <- food_lencomp %>%
  mutate(month = ifelse(Seas==1,4,10)) %>%
  mutate(fleet = rep(14,nrow(food_lencomp))) %>%
  select(-Seas) %>%
  select(-Flt) %>%
  select(Yr,month,fleet,everything())

write.table(food_lencomp,file='foodlengths.out',row.names=FALSE,col.names = F)

#### end food habits info ###

survagecomp2 <- survagecomp %>%
  group_by(YEAR,Gender,Part,Ageerr,Lbin_lo,Lbin_hi) %>%
  summarise_all(sum)
survagecomp2

area = c(rep(1:2,each=4),rep(1:2,times=2),c(1,1))
survagecomp <- rename(survagecomp, "fleet" = Flt)
df3 <- rbind(agecomp,survagecomp) %>%
  mutate(area = area[fleet]) %>%
  select(area,everything())

df4 <- df3 %>%
  select(-fleet) %>%
  group_by(YEAR,month,area,Gender,Part,Ageerr,Lbin_lo,Lbin_hi) %>%
  summarise_all(sum) %>%
  #mutate(area = ifelse(area==1,1,5)) %>%
  rename("fleet" = area)

df4$fleet[df4$fleet==2] <- 5

write.table(df4,file='condensed_agecomp.out',row.names=FALSE,col.names = F)
write.table(t(c(-9999,rep(0,ncol(agecomp)-1))),file='condensed_agecomp.out',
            row.names = F, col.names = F,
            append = TRUE)


survagecomp <- rename(survagecomp, "fleet" = Flt)
df3 <- rbind(agecomp,survagecomp) %>%
       mutate(nfish = rowSums(df3[,-(1:9)])) %>% 
       select(-NUMTOWS) %>%
       select(YEAR,month,fleet,Gender,Part,Ageerr,Lbin_lo,Lbin_hi,nfish,everything())

df3 <- mutate(df3,Ageerr = ifelse(month==4,1,2))

write.table(df3,file='nfish_agecomp.out',row.names=FALSE,col.names = F)
write.table(t(c(-9999,rep(0,ncol(agecomp)-1))),file='nfish_agecomp.out',
            row.names = F, col.names = F,
            append = TRUE)

write.table(df33,file='nfish_agecomp.out',row.names=FALSE,col.names = F)
write.table(t(c(-9999,rep(0,ncol(agecomp)-1))),file='nfish_agecomp.out',
            row.names = F, col.names = F,
            append = TRUE)


ggplot(survagecomp,aes(YEAR,NUMTOWS,group=fleet)) +
         geom_line()
       
bob <- df3[,c(1,2,3,7,10)]
bob

df3 <- rbind(agecomp,survagecomp) #survagecomp
names(df3)[10:24] <- 1:15
bob <- df3 %>% gather(key = age, value = n, 10:24) %>%
  filter(n>0)
bob$F2 <- as.factor(bob$fleet)

plotdat <- filter(bob,age%in%c(2),fleet%in%c(1,3,5,7,9,10))
ggplot(plotdat,aes(x = YEAR, y = Lbin_lo, color = month,weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point() +
  stat_smooth() + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(age~fleet)

#age 1's in fleet 7 seem to be too large (fall?, age 2's?)  15cm vs 8/9
#same with age 2's  (17 vs 15)

plotdat <- filter(bob,age%in%c(2),fleet%in%c(2,4,6,8,11,12))
ggplot(plotdat,aes(x = YEAR, y = Lbin_lo, color = month,weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point() +
  stat_smooth() + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(age~fleet)
# GOM fall commercial fleets seem to be catching smaller fish at age than fall surveys. particularly fixed fleet.
#(age 1's 10 vs 15)
#age 2's  16/17 vs 19

bob <- bob %>% mutate(area=ifelse(fleet%in%c(1:4,9,11,13),"GOM","GB"))
plotdat <- filter(bob,age%in%c(1,2)) #,fleet%in%c(2,4,6,8,11,12))
ggplot(plotdat,aes(x = YEAR, y = Lbin_lo, color = F2, shape = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point() +
  stat_smooth() + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(age+area~month)


df3 <- agecomp
names(df3)[10:24] <- 1:15
bob <- df3 %>% gather(key = age, value = n, 10:24)

ggplot(filter(bob,age==1)) +
  geom_point(mapping = aes(x = YEAR, y = Lbin_lo, size = n, color = fleet)) + facet_grid(~month)

#
bob <- mutate(bob, "type" = ifelse(fleet<=8,"fishery","survey"))
bob$age <- as.numeric(bob$age)
bob <- mutate(bob, "growth" = ifelse(YEAR<=1992,"pre-93","post-93"))
plotdat <- filter(bob,fleet%in%c(2,4,6,8,11,12),age%in%c(6:7)) #
ggplot(plotdat,aes(x = YEAR, y = Lbin_lo, color = F2, shape = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point(alpha=0.5) +
  stat_smooth(method = "loess") + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(age~area)

ggplot(plotdat,aes(x = age, y = Lbin_lo, color = type, shape = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point(alpha=0.5) +
  stat_smooth(method = "loess") + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(area~growth) +
  ggtitle("Season 2")

plotdat <- filter(bob,fleet%in%c(1,3,5,7,9,10)) #,age%in%c(1,2)) #
ggplot(plotdat,aes(x = YEAR, y = Lbin_lo, color = type, shape = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point(alpha=0.5) +
  stat_smooth(method = "loess") + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(age~area)

ggplot(plotdat,aes(x = age, y = Lbin_lo, color = type, shape = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point(alpha=0.5) +
  stat_smooth(method = "loess") + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(area~growth) +
  ggtitle("Season 1")
# 
# bob2 <- bob %>% mutate(age2 = ifelse(type == "survey" & month == "10",age+0.25,age))
# plotdat <- filter(bob2,fleet%in%c(2,4,6,8,11,12)) #,age%in%c(1,2)) #
# ggplot(plotdat,aes(x = age2, y = Lbin_lo, color = type, shape = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
#   geom_point(alpha=0.5) +
#   stat_smooth(method = "loess") + #, 
#   #            method.args = list(weights = n)) # + 
#   facet_grid(area~growth) +
#   ggtitle("Season 2")
# 

#########
## look at lenght comps

survlencomp <- rename(survlencomp, "fleet" = Flt)

l2 <- rbind(lencomp,survlencomp)
gg <- l2[,-(1:5)]
gg2 <- as.matrix(gg[,-1]/rowSums(gg[,-1]))
for (i in 1:nrow(gg2)) gg2[i,] <- gg2[i,]*as.numeric(gg[i,1])
l2 <- as.tibble(cbind(l2[,1:6],as.tibble(gg2)))
names(l2)[7:43] <- 3:39
l2 <- l2 %>% gather(key = length, value = n, 7:43) %>% filter(n>0) %>%
  mutate(area=ifelse(fleet%in%c(1:4,9,11,13),"GOM","GB"))
l2$F2 <- as.factor(l2$fleet)
l2$length <- as.numeric(l2$length)

plotdat <- filter(l2,fleet%in%c(1:8))
ggplot(plotdat,aes(x = Yr, y = length, color = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  #geom_point() +
  stat_smooth(method="loess") + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(area~month)

plotdat <- filter(l2,fleet%in%c(1:8))
ggplot(plotdat,aes(x = Yr, y = length, color = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point(alpha=0.5) +
  #stat_smooth(method="loess") + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(area~month)

plotdat <- filter(l2,fleet%in%c(9:13))
ggplot(plotdat,aes(x = Yr, y = length, color = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  geom_point(alpha=0.5) +
  #stat_smooth(method="loess") + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(area~month)

plotdat <- filter(l2) #,fleet%in%c(9:13))
ggplot(plotdat,aes(x = Yr, y = length, color = F2, weight=n,size=n)) + #%in%c("1"))) + #,"2"))) +# & month==4)) +
  #geom_point() +
  stat_smooth(method="loess") + #, 
  #            method.args = list(weights = n)) # + 
  facet_grid(area~month)


###
al <- rep(bob$Lbin_lo,bob$n)
aa <- rep(bob$age,bob$n)
at <- rep(bob$type,bob$n)
af <- rep(bob$fleet,bob$n)
as <- rep(bob$area,bob$n)
adat <- as.tibble(list(len=al,age=aa,type=at,fleet=af,area=as))
#ggplot(adat,aes(x=age,y=len,group=c(age),fill=type)) +
#  geom_boxplot()
with(adat,boxplot(len~type+age,col=c("blue","orange")))
