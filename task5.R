library(readxl)
payment1<-read_xlsx('E:/payment_msk.xlsx',sheet=1)
library(comprehenr)
debt<-payment1$DebtQuantityUPD[c(1:141)]
debt_q<-to_vec(for(i in debt)as.double(i))
median(debt_q)
quantile(debt_q)
library(ggplot2)
data_pay<-data.frame(y=debt_q)
ggplot(data_pay)+geom_boxplot(aes(x = "Median \n& quantiles",y = debt_q))+labs(x = "Quantity",y = "Quantity Debt")
quantity1<-payment$CurrentQuantityUPD[c(1:141)]
pay<-to_vec(for(i in quantity1)as.double(i))
median(pay)
quantile(pay)
mean(debt_q)
sd(debt_q)
mean(pay)
sd(pay)
library(Hmisc)
mean_sdl(debt_q)
library(ggplot2)
data_pay<-data.frame(y=debt_q)
ggplot(data_pay)+stat_summary(geom='pointrange',fun.data=mean_sdl,fun.args=list(mult=1),aes(x='Mean\n&standard deviation',y=debt_q)+labs(x='Quantity',y='Quantity Debt'))
cor(debt_q,pay,method="pearson")












