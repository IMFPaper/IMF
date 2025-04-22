######## INFO ########
# Authors: Dianyi Yang
# R Script
# Purpose: This script runs PCA and regression analysis for the demo.
# Inputs: data/panel_data.dta
# Outputs: save/regtable.RData


# SETUP ----------------------------------------------------------------------------------------------------------------
rm(list = ls()) # Clear workspace

need <- c(
  'tidyverse',
  'haven',
  'AER',
  'fixest',
  'modelsummary',
  'corrplot',
  "ggfortify"
) # list packages needed
have <- need %in% rownames(installed.packages()) # checks packages you have
if (any(!have)) install.packages(need[!have]) # install missing packages
invisible(lapply(need, library, character.only = T))

setwd(gsub('/code','',dirname(rstudioapi::getSourceEditorContext()$path)))
data <- read_dta("data/panel_data.dta")

#PCA
PCA <- data |>
  select(shstaffl,shquotal,frusanew,
         frdfgnew,ustradenew,eutradenew,
         usq4,avgukfrgmq4) |>
  na.omit() |>
  prcomp(scale=T)
summary(PCA)

plot(PCA, type="l")
autoplot(PCA,loadings = TRUE, loadings.label = TRUE,)

#3 components
IMF <- a |>
  select(shstaffl,shquotal) |>
  na.omit() |>
  prcomp(scale=T)
summary(IMF)

US <- a |>
  select(frusanew, ustradenew, usq4) |>
  na.omit() |>
  prcomp(scale=T)
summary(US)

EU <- a |>
  select(frdfgnew, eutradenew, avgukfrgmq4) |>
  na.omit() |>
  prcomp(scale=T)
summary(EU)

#regression
data$imf <- -predict(IMF, data)[,1]
data$us <- predict(US, data)[,1]
data$eu <- predict(EU, data)[,1]
data$pca <- -predict(PCA, data)[,1]

#plot correlation
corr <- data |>
  select('imf','us','eu','pca') |>
  cor(use='pairwise.complete.obs')

corrplot(corr, method='color')

 #tobit regression - IMF loan to GDP ratio
loan <- tobit(imfloannew100 ~ us + eu + imf + lnrgdpnew + lnrgdpnewsq + rgdpchnew + 
              rgdpchnewsquare + growth1new + reserv1 + oecd1 + year1980 + year1985 + 
              year1990 + year1995 + year2000, data=data, left=0, right=Inf, 
              cluster=shcode)

summary(loan)

 #tobit regression - IMF participation rate
part <- tobit(imf_p ~ us + eu + imf + lnrgdpnew + lnrgdpnewsq + rgdpchnew + 
              rgdpchnewsquare + growth1new + reserv1 + oecd1 + year1980 + year1985 + 
              year1990 + year1995 + year2000, data=data, left=0, right=1, 
              cluster=shcode)
summary(part)

 #probit regression - IMF loan approval
approval <- feglm(imf5a ~ us + eu + imf + lnrgdpnew + lnrgdpnewsq + rgdpchnew + 
                  rgdpchnewsquare + growth1new + reserv1 + oecd1 + year1980 + year1985 + 
                  year1990 + year1995 + year2000, data=data, family=binomial(link="probit"),
                  cluster='shcode')
summary(approval)

 #tobit Total number of IMF conditions
condition <- tobit(tc ~ us + eu + imf + lnrgdpnew + lnrgdpnewsq + rgdpchnew + 
                     rgdpchnewsquare + growth1new + reserv1 + oecd1 + year1980 + year1985 + 
                     year1990 + year1995 + year2000, data=data, left=0, right=Inf, 
                     cluster=shcode)
summary(condition)

#t-tests


#regression table
regtable <- list('Tobit: IMF loan to GDP ratio' = loan, 
                 'Tobit: IMF participation rate' = part, 
                 'Probit: IMF loan approval' = approval, 
                 'Tobit: number of IMF conditions' = condition)
save(regtable, data, file='save/regtable.RData')
msummary(regtable, stars=T)

#ftest
#tobit regression - IMF loan to GDP ratio
loan_f <- tobit(imfloannew100 ~ shstaffl+shquotal+frusanew+frdfgnew+ustradenew+
                  eutradenew+usq4+avgukfrgmq4 + lnrgdpnew + lnrgdpnewsq + rgdpchnew + 
                rgdpchnewsquare + growth1new + reserv1 + oecd1 + year1980 + year1985 + 
                year1990 + year1995 + year2000, data=data, left=0, right=Inf, 
              cluster=shcode)
  #significance of US
  matrix = c('frusanew = 0', 'ustradenew = 0', 'usq4 = 0')
  lht(loan_f, test='F', matrix)
  #significance of EU
  matrix = c('frdfgnew = 0', 'eutradenew = 0', 'avgukfrgmq4 = 0')
  lht(loan_f, test='F', matrix)
  
#tobit Total number of IMF conditions
  condition_f <- tobit(tc ~ shstaffl+shquotal+frusanew+frdfgnew+ustradenew+
                         eutradenew+usq4+avgukfrgmq4 + lnrgdpnew + lnrgdpnewsq + rgdpchnew + 
                       rgdpchnewsquare + growth1new + reserv1 + oecd1 + year1980 + year1985 + 
                       year1990 + year1995 + year2000, data=data, left=0, right=Inf, 
                     cluster=shcode)
  #significance of US
  matrix = c('frusanew = 0', 'ustradenew = 0', 'usq4 = 0')
  lht(condition_f, test='F', matrix)
  #significance of EU
  matrix = c('frdfgnew = 0', 'eutradenew = 0', 'avgukfrgmq4 = 0')
  lht(condition_f, test='F', matrix)
  