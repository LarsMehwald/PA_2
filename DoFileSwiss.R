###########################
# Do File ofr the First Pair Assingment
# Lars Mehwald and Daniel Salgado Moreno
# 2 October 2015
###########################

## First, we will set the working directory:
setwd("~/HSoG/DataAnalysis/GitHub/PA/PA")

## Second, we open one core data set to use in this exercise: Swiss
data(swiss)
?swiss
names(swiss)
head(swiss[1:3, 1:4])
summary(swiss)

# Descriptive Statistics
## Creating a function for the Mean
edu_mean <- function(x){sum(x)/length(x)}

##find the mean
edu_mean(x=swiss$Education)
mean(swiss$Education)
mean(swiss$Education, na.rm=TRUE)

## variance
var(swiss$Education)

##Standar dev.
sd(swiss$Education)

##Standar Error
sderror <- function(x) {sd(x)/sqrt(length(x))}
sderror(swiss$Education)

## Max
max(swiss$Education)

## Quantiles 0.25 and 0.75 for Education 
quantile(swiss$Education, c(0.25,0.75))
## Calculates All quantiles
quantile(swiss$Education)

### Correlation, Variance and Covariance (Matrices)
#### Variance 
var(swiss$Education, use="everything")
#### Correlation Matrix of Multivariate sample:
#### graphical correlation matrix
cor(swiss) %>% symnum()
## OR
cor(swiss, method = c("kendall"))

### Distributions 
# Exploring alternative options for the hist
hist(swiss$Education, main = 'Swiss Canton Education Attainment (1888)',
      xlab='Percentage of population with education beyond primary school for draftees')

### Boxplot
boxplot(swiss$Catholic, main = 'Swiss Canton Catholic Proportion of Protestant')

### Natural Log to transformed skewed data 
#### (NOTE: to be able to use %>% we have to activate Packages 'dplyr' and 'magrittr')
log(swiss$Education) %>% hist(main = "Swiss Education")

### Scatter plot for relation Education and Faith
plot(log(swiss$Education), swiss$Catholic, 
     main = "Swiss Cantons Education to Faith relation", 
     xlab = "% education beyond primary school for draftees", 
     ylab="% ‘catholic’ (as opposed to ‘protestant’)")

### plot Education and Agriculture occupation
plot(log(swiss$Education), swiss$Agriculture, 
     main = "Swiss Cantons Education to Faith relation", 
     xlab = "% education beyond primary school for draftees", 
     ylab="% of males involved in agriculture as occupation")

#Activate package ggplot2
#Plot Education and Agricultre
ggplot2::ggplot(swiss, aes(log(Education), Agriculture)) +
  geom_point() + geom_smooth() + theme_bw()

## Saving the data into Comma-separated values (.csv)
write.csv(swiss, file="~/HSoG/DataAnalysis/GitHub/PA/PA/SwissDataSet.csv", na="NA",
          row.names = FALSE)

### Saving Workspace into project
save.image("~/HSoG/DataAnalysis/GitHub/PA/PA/WorkspaceSwiss.RData")

### Saving History into project
savehistory("~/HSoG/DataAnalysis/GitHub/PA/PA/HistorySwiss.Rhistory")



