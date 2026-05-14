#ASSIGNMENT NO.6: Data Aggregation, Cross-Tabulation, 
#Exploring 
#Use customer_data.csv to solve following questions

data <- read.csv("C:\\Users\\Public\\OneDrive\\Documents\\r studio & p\\assignments\\customer_sales_sample.csv") 

#Q1) Sales Performance Analysis 
#a) Total sales by region 
#b) Average sales per gender 
#c) Frequency distribution of purchase 
#d) Cross-tab: Region vs Purchase 
#e) Chi-square test 
#Load Dataset 
data <- read.csv("customer_sales_sample.csv") 

#Q1) Sales Performance Analysis 
#a) Total sales by region 
aggregate(Amount ~ Region, data, sum) 

#b) Average sales per gender 
aggregate(Amount ~ Gender, data, mean) 

#c) Frequency distribution of purchase 
table(data$Purchase) 

#d) Cross-tab: Region vs Purchase 
table(data$Region, data$Purchase) 

#e) Chi-square test 
chisq.test(table(data$Region, data$Purchase)) 


#Q2) Customer Segmentation 
#a) Count customers by region 
#b) Average purchase by region using tapply 
#c) Frequency of gender 
#d) Cross-tab: Gender vs Region 
#e) Chi-square test 

#Customer Segmentation  
#a) Count customers by region 
table(data$Region) 

#b) Average purchase by region using tapply 
tapply(data$Amount, data$Region, mean) 

#c) Frequency of gender 
table(data$Gender) 

#d) Cross-tab: Gender vs Region 
table(data$Gender, data$Region) 

#e) Chi-square test 
chisq.test(table(data$Gender, data$Region)) 

#Purchase Pattern Analysis 
#a) Total purchase amount 
#b) Row-wise sum using apply 
#c) Frequency of purchase 
#d) Cross-tab: Purchase vs Region 
#e) Chi-square test 

#Purchase Pattern Analysis  
#a) Total purchase amount 
sum(data$Amount) 

#b) Row-wise sum using apply 
numeric_data <- data.frame(data$Amount) 
apply(numeric_data, 1, sum) 

#c) Frequency of purchase 
table(data$Purchase) 

#d) Cross-tab: Purchase vs Region 
table(data$Purchase, data$Region) 

#e) Chi-square test 
chisq.test(table(data$Purchase, data$Region)) 

#Q4. High-Value Customer Analysis 
#a) Filter customers with Amount > 5000 
#b) Mean purchase of filtered group 
#c) Frequency of region (filtered) 
#d) Cross-tab: Gender vs Purchase (filtered) 
#e) Chi-square test 
#High-Value Customer Analysis  

#a) Filter customers with Amount > 5000 
high_value <- data[data$Amount > 5000, ] 
high_value 

#b) Mean purchase of filtered group 
mean(high_value$Amount) 

#c) Frequency of region (filtered) 
table(high_value$Region) 

#d) Cross-tab: Gender vs Purchase (filtered) 
table(high_value$Gender, high_value$Purchase) 

#e) Chi-square test 
chisq.test(table(high_value$Gender, high_value$Purchase)) 

#Q5. Business Decision Analysis 
#a) Total revenue 
#b) Average revenue per region 
#c) Frequency distribution of regions 
#d) Cross-tab: Region vs Purchase 
#Statistical inference 

#Business Decision Analysis  
#a) Total revenue 
sum(data$Amount) 
#b) Average revenue per region 
aggregate(Amount ~ Region, data, mean) 

#c) Frequency distribution of regions 
table(data$Region) 

#d) Cross-tab: Region vs Purchase 
table(data$Region, data$Purchase) 

#e) Statistical inference 
chisq.test(table(data$Region, data$Purchase))