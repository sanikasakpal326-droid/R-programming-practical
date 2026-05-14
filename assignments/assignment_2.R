#assignment 2 (5-5-26)

#Q.1) use following data frame to solve following questions

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

#Q.1)

# Price > 20000
sales_data[sales_data$Price > 20000, ]

# City = Pune
sales_data[sales_data$City == "Pune", ]

# Quantity > 5
sales_data[sales_data$Quantity > 5, ]

# Category = Electronics
sales_data[sales_data$Category == "Electronics", ]

# Combine conditions
sales_data[sales_data$Price > 20000 & sales_data$City == "Pune", ]

#Q.2)

#Sort by Price
sales_data[order(sales_data$Price), ]
# Sort by Revenue
sales_data[order(sales_data$Revenue), ]
#Sort by City 
sales_data[order(sales_data$City), ]
# Sort by Quantity descending
sales_data[order(-sales_data$Quantity), ]
#Sort by multiple columns
sales_data[order(sales_data$City,-sales_data$Revenue), ]

#Q.3)

#Total revenue by city
aggregate(Revenue~City,sales_data,sum)
# Average price by category
aggregate(Price~Category,sales_data, mean)
# Total quantity sold by product
aggregate(Quantity~Product, sales_data, sum)
# Maximum order value by city
aggregate(Revenue ~ City, sales_data, max)
# Minimum order value by product
aggregate(Revenue ~ Product,sales_data, min)


#Q.4)

#high Discount
sales_data$DiscountFlag<-ifelse(sales_data$Discount>10,"High Discount","Normal")
#order Category
sales_data$OrderCatergory<-ifelse(sales_data$Revenue>30000,"High",
                ifelse(sales_data$Revenue>10000,"medium","Low"))
#forloop(print revenue
for(i in 1:nrow(sales_data)){
  print(sales_data$Revenue[i])

}
#while loop (cumulative revenue)
i<-1
total<-0

while(i<=nrow(sales_data)){
  total<-total+sales_data$Revenue[i]
  i<-i+1
}
print(total)

#skip fashion category
sales_data[sales_data$Category!="Fashion",]

#Q.5)Discount Abalysis

#average discount
mean(sales_data$Discount)
#order with discount>10%
sales_data[sales_data$Discount>10,]
#total discount amount
sum(sales_data$DiscountAmount)
#city with highest discount
aggregate(DiscountAmount~City,sales_data,sum)
#count discount levels
table(sales_data$Discount)

#Q.6)

# Electronics + Price > 20000
sales_data[sales_data$Category=="Electronics" & sales_data$Price > 20000,]
# Fashion + Quantity > 5
sales_data[sales_data$Category=="Fashion" & sales_data$Quantity > 5,]
#Pune + Discount > 10
sales_data[sales_data$City=="Pune" & sales_data$Discount > 10,]
# Revenue > 50000 + Cash
sales_data[sales_data$Revenue > 50000 & sales_data$PaymentMethod=="Cash", ]
#High price +high quantity
sales_data[sales_data$Price > 30000& sales_data$Quantity > 5,]