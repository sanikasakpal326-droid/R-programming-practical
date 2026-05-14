# Assignment_3 wprkbook praticalS

set.seed(123)

sales_data <- data.frame(
  OrderID = 1:100,
  CustomerName = sample(c("Rahul","Amit","Priya","Neha","Arjun","Sneha","Rohit","Kiran"), 100, replace = TRUE),
  City = sample(c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"), 100, replace = TRUE),
  Product = sample(c("Laptop","Mobile","Tablet","Shoes","Watch"), 100, replace = TRUE),
  Category = sample(c("Electronics","Fashion"), 100, replace = TRUE),
  Quantity = sample(1:10, 100, replace = TRUE),
  Price = sample(seq(500,50000,500), 100, replace = TRUE),
  Discount = sample(c(0,5,10,15,20), 100, replace = TRUE),
  PaymentMethod = sample(c("Cash","Card","UPI"), 100, replace = TRUE)
)

sales_data$Revenue <- sales_data$Quantity * sales_data$Price
sales_data$DiscountAmount <- sales_data$Revenue * sales_data$Discount / 100
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount

head(sales_data)


#Problems on Recoding Variables, Sorting and New Variable Creation  
#a) Create OrderSize (Small, Medium, Large)  
#b) Sort by Quantity descending  
#c) Sort by City and Revenue  
#d) Create Tax column  
#e) Create TotalBill column 

#answers
#a) Create OrderSize (Small, Medium, Large) 
sales_data$OrderSize <- ifelse(sales_data$Quantity <= 3, "Small",                       
ifelse(sales_data$Quantity <= 7, "Medium", "Large")) 
head(sales_data)

#b) Sort by Quantity descending 
sales_data[order(-sales_data$Quantity), ] 

#c) Sort by City and Revenue 
sales_data[order(sales_data$City, -sales_data$Revenue), ] 

#d) Create Tax column 
sales_data$Tax <- sales_data$Revenue * 0.18
head(sales_data)

#e) Create TotalBill column 
sales_data$Tax <- sales_data$Revenue * 0.18
sales_data$TotalBill <- sales_data$Revenue + sales_data$Tax
head(sales_data)

#Q2) Problems on dplyr select() and filter() 
#a) Select CustomerName and Product 
#b) Select numeric columns 
#c) Remove Discount column 
#d) Filter Pune customers 
#e) Filter multiple conditions (Price > 20000 and Quantity > 5) 

#Problems on dplyr select() and filter() 
install.packages("dplyr")
library(dplyr)

#a) Select CustomerName and Product 
select(sales_data, City, Product)

#b) Select numeric columns 
select_if(sales_data, is.numeric)

#c) Remove Discount column 
select(sales_data, -Discount) 

#d) Filter Pune customers 
filter(sales_data, City == "Pune") 

#e) Filter multiple conditions (Price > 20000 and Quantity > 5) 
filter(sales_data, Price > 20000 & Quantity > 5) 

#Q3) Problems on Using mutate() and arrange() 
#a) Create Tax variable 
#b) Create Profit variable 
#c) Create OrderCategory 
#d) Create DiscountCategory 
#e) Create PaymentType variable 
#f) Sort by Revenue descending by using arrange() 

#Problems on Using mutate() and arrange() 
#a) Create Tax variable 
sales_data <- sales_data %>% 
  mutate(Tax = FinalAmount * 0.18) 
  print(sales_data$Tax)
  
#b) Create Profit variable 
sales_data <- sales_data %>% 
  mutate(Profit = FinalAmount * 0.20)
 print(sales_data$Profit)
 
#c) Create OrderCategory 
sales_data <- sales_data %>% 
  mutate(OrderCategory = ifelse(Revenue > 30000, "High", 
  ifelse(Revenue > 10000, "Medium", "Low"))) 
  print(sales_data$OrderCategory)
  
#d) Create DiscountCategory 
sales_data <- sales_data %>% 
mutate(DiscountCategory = ifelse(Discount > 10, "High Discount","Low Discount")) 
print(sales_data$DiscountCategory)

#e) Create PaymentType variable 
sales_data <- sales_data %>% 
mutate(PaymentType = PaymentMethod) 
print(sales_data$PaymentMethod)

#f) Sort by Revenue descending using arrange() 
sorted_revenue<-sales_data%>%
arrange(desc(Revenue))
print(sorted_revenue)
  
#Q4) Problems on Using group_by() and summarise() 
#a) Total revenue by city 
#b) Average price by product 
#c) Total quantity sold by product 
#d) Maximum revenue by city 
#e) Minimum revenue by product 

#Problems on Using group_by() and summarise() 
#a) Total revenue by city 
sales_data %>% 
group_by(City) %>% 
summarise(TotalRevenue = sum(Revenue)) 
print(sales_data$Revenue)
#b) Average price by product 
average_price_product<-sales_data %>% 
group_by(Product) %>% 
summarise(AveragePrice = mean(Price)) 
print(average_price_product)

#c) Total quantity sold by product 
total_quantity_product<-sales_data %>% 
group_by(Product) %>% 
summarise(TotalQuantity = sum(Quantity)) 
print(total_quantity_product)

#d) Maximum revenue by city 
maximum_revenue_product<-sales_data %>% 
group_by(City) %>% 
summarise(MaxRevenue = max(Revenue)) 
print(maximum_revenue_product)

#e) Minimum revenue by product 
minimum_revenue_product<-sales_data %>% 
group_by(Product) %>% 
summarise(MinRevenue = min(Revenue)) 
print(minimum_revenue_product)

#Q5) Problems on Customer Analysis 
#1. Count orders per customer 
#2. Total revenue per customer 
#3. Average order value 
#4. Top customer 
#5. Sort customers by revenue

#Problems on Customer Analysis 
#1) Count orders per customer 
count_order_product<-sales_data %>% 
group_by(CustomerName) %>% 
summarise(OrderCount = n()) 
print(count_order_product)

#2) Total revenue per customer 
total_revenue_product<-sales_data %>% 
group_by(CustomerName) %>% 
summarise(TotalRevenue = sum(Revenue)) 
print(total_revenue_product)

#3) Average order value 
mean(sales_data$Revenue) 

#4) Top customer 
top_customer_product<-sales_data %>% 
group_by(CustomerName) %>% 
summarise(TotalRevenue = sum(Revenue)) %>% 
arrange(desc(TotalRevenue)) 
print(top_customer_product)

#5) Sort customers by revenue 
sort_customer_product<-sales_data %>% 
group_by(CustomerName) %>% 
summarise(TotalRevenue = sum(Revenue)) %>% 
arrange(desc(TotalRevenue))
print(sort_customer_product)

# Create Revenue column
sales_data$Revenue <- sales_data$Quantity* sales_data$Price
#Create DiscountA mount column
sales_data$DiscountAmount <- sales_data$Revenue * sales_data$Discount / 100
#Create FinalAmount column
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount
print(head(sales_data))