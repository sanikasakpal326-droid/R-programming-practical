#ASSIGNMENT NO.9: Introduction to S3 and S4 Classes and  
#Using R Objects and References 
#Use oop_customer_data.xlsx  to solve following questions 
# ------------------------------------------------- 
# Install and Load Required Package 
# ------------------------------------------------- 
install.packages("readxl") 
library(readxl) 
# ------------------------------------------------- 
# Create Dataset 
# ------------------------------------------------- 
set.seed(123) 
data <- data.frame( 
  CustomerID = 1:10, 
  Name = c( 
    "Rahul","Amit","Priya","Neha","Arjun", 
    "Sneha","Rohit","Kiran","Pooja","Vikas" 
  ), 
  Age = sample(20:60, 10), 
  Income = sample( 
    30000:100000, 
    10 
  ), 
  Membership = sample( 
    c("Silver","Gold","Platinum"), 
    10, 
    replace = TRUE 
  ), 
  SpendingScore = sample( 
    1:100, 
    10 
  ) 
) 
# Display Dataset 
data 
# --------------------------
#Q1) Customer Object Modeling (S3 System) 
#Scenario: A retail company wants to convert customer records into structured objects. 
#1. Create an S3 class "Customer" using dataset rows. 
#2. Assign attributes like Age, Income, Membership. 
#3. Create a custom print.Customer() method. 
#4. Extract and display customer details using object reference. 
#5. Modify one attribute and observe behavior. 

#Create an S3 class "Customer" using dataset rows. 
# Create Customer Object 
customer <- list( 
  Name = "Rahul", 
  Age = 30, 
  Income = 55000, 
  Membership = "Gold" 
) 
# Assign S3 Class 
class(customer) <- "Customer" 
customer 

#2. Assign attributes like Age, Income, Membership. 
# Access Attributes 
customer$Age 
customer$Income 
customer$Membership 
  
#3. Create a custom print.Customer() method. 
# Custom Print Method 
print.Customer <- function(obj) 
{ 
  cat("Customer Details\n") 
  cat("------------------\n") 
  cat("Name      
 :", obj$Name, "\n") 
  cat("Age        
:", obj$Age, "\n") 
  cat("Income     :", obj$Income, "\n") 
  cat("Membership :", obj$Membership, "\n") 
} 
# Print Object 
print(customer) 

#4. Extract and display customer details using object reference. 
# Display Individual Details 
customer$Name 
customer$Age 
customer$Income 
customer$Membership 
  
#5. Modify one attribute and observe behavior. 
# Modify Membership 
customer$Membership <- "Platinum" 
# Display Updated Object 
print(customer) 

#Q2) Advanced Customer Class (S4 System) 
#Scenario: A banking system requires strict validation of customer records. 
#1. Define an S4 class "Customer" with slots (Age, Income, Membership). 
#2. Create objects from dataset rows. 
#3. Write a show() method. 

#1. Define an S4 class "Customer" with slots (Age, Income, Membership). 
# Define S4 Class 
setClass( 
  "Customer", 
  slots = list( 
    Age = "numeric", 
    Income = "numeric", 
    Membership = "character" 
  ) 
) 

#2. Create objects from dataset rows. 
# Create Customer Object 
customer1 <- new( 
  "Customer", 
  Age = 35, 
  Income = 75000, 
  Membership = "Gold" 
) 
customer1 
  
#3. Write a show() method. 
# Custom Show Method 
setMethod( 
  "show", 
  "Customer", 
  function(object) 
  { 
    cat("Customer Details\n") 
    cat("------------------\n") 
    cat("Age        
:", object@Age, "\n") 
    cat("Income     :", object@Income, "\n") 
    cat("Membership :", object@Membership, "\n") 
  } 
) 
# Display Object 
customer1 

#Q3) Object Referencing and Copy Behavior 
#Scenario: A data analyst copies dataset for experimentation. 
#1. Assign dataset to new variable. 
#2. Modify one column in copied dataset. 
#3. Check if original dataset changes. 
#4. Use identical() to compare objects. 

#1. Assign dataset to new variable. 
library(readxl) 
# Load Dataset 
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx", 
                   sheet = "customers") 
# Copy Dataset 
data_copy <- data 

#2. Modify one column in copied dataset. 
# Modify Income Column in Copied Dataset 
data_copy$Income <- data_copy$Income + 5000 
# Display Modified Copy 
head(data_copy) 
 
#3. Check if original dataset changes. 
# Display Original Dataset 
head(data) 
  
#4. Use identical() to compare objects. 
# Compare Original and Modified Dataset 
identical(data, data_copy) 

#Q4) Memory Optimization Study 
#Scenario: Company wants to optimize memory usage. 
#1. Create large object from dataset. 
#2. Check memory usage using object.size(). 
#3. Remove unnecessary objects using rm(). 
#4. Run garbage collection. 

#1. Create large object from dataset. 
library(readxl) 
# Load Dataset 
# Create Large Object 
large_data <- rbind(data, 
                    data, 
                    data, 
                    data, 
                    data) 
# Display First Records 
head(large_data) 
  
#2. Check memory usage using object.size(). 
# Check Memory Usage 
object.size(large_data) 
  
#3. Remove unnecessary objects using rm(). 
# Remove Object 
rm(large_data) 
 
#4. Run garbage collection. 
# Garbage Collection 
gc() 

#Q5) List-Based Customer Object System 
#Scenario: System uses lists instead of data frames. 
#1. Convert dataset into list of customers. 
#2. Assign S3 class to each list element. 
#3. Access nested values. 
#4. Modify one customer's data. 
#5. Print structure using str(). 

#1. Convert dataset into list of customers. 
library(readxl) 
# Load Dataset 
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx", 
sheet = "customers") 
# Convert Dataset into List 
customer_list <- split(data, seq(nrow(data))) 
# Display First Customer 
customer_list[[1]] 
 
#2. Assign S3 class to each list element. 
#Assign S3 Class to Each Customer 
customer_list <- lapply(customer_list, function(x) 
{ 
class(x) <- "Customer" 
return(x) 
})

# Check Class 
class(customer_list[[1]]) 
 
#4. Modify one customer's data. 
# Modify Customer Income 
customer_list[[1]]$Income <- 80000 
# Display Updated Customer 
customer_list[[1]] 
  
#5. Print structure using str(). 
# Display Structure 
str(customer_list) 

#Q6) Class Inspection and Documentation 
#Scenario: Developer needs to inspect object structure. 
#1. Check class of dataset. 
#2. Use str() to inspect structure. 
#3. Extract attributes. 
#4. Use summary() for overview. 

#1. Check class of dataset. 
library(readxl) 
# Load Dataset 
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx", 
                   sheet = "customers") 
# Check Class 
class(data) 
  
#2. Use str() to inspect structure. 
# Inspect Structure 
str(data) 
 
#3. Extract attributes. 
# Extract Attributes 
attributes(data) 

#4. Use summary() for overview. 
# Summary of Dataset 
summary(data) 
 
#Q7) S4 Slot Manipulation 
#Scenario: Product system tracks spending behavior. 
#1. Create S4 class "SpendingProfile". 
#2. Add slots for SpendingScore and Income. 
#3. Create object using dataset values. 
#4. Access slots using @. 
#5. Modify slot values and validate. 
#1. Create S4 class "SpendingProfile". 
# Create S4 Class 
setClass( 
  "SpendingProfile", 
  slots = list( 
    SpendingScore = "numeric", 
    Income = "numeric" 
  ) 
) 

#2. Add slots for SpendingScore and Income. 
# Display Class Definition 
getClass("SpendingProfile") 

#3. Create object using dataset values. 
library(readxl) 
# Load Dataset 
# Create Object 
profile1 <- new( 
  "SpendingProfile", 
  SpendingScore = 78, 
  Income = 65000 
) 
profile1 
  
#4. Access slots using @. 
# Access Slot Values 
profile1@SpendingScore 
profile1@Income 

#5. Modify slot values and validate. 
# Modify Slot Values 
profile1@SpendingScore <- 90 
profile1@Income <- 75000 
# Display Updated Object 
profile1 

#Q8) Advanced Data Structure Integration 
#Scenario: Company integrates multiple data sources. 
#1. Create nested list containing dataset and summary. 
#2. Access inner elements. 
#3. Modify nested structure. 
#4. Apply class to nested object. 
#5. Display structure using str(). 
#1. Create nested list containing dataset and summary. 
library(readxl) 
# Load Dataset 
# Create Summary 
sales_summary <- summary(data) 
# Create Nested List 
company_data <- list( 
  Dataset = data, 
  Summary = sales_summary 
) 
company_data 
  

#2. Access inner elements. 
# Access Dataset 
company_data$Dataset 
# Access Summary 
company_data$Summary 

#3. Modify nested structure. 
# Add New Element 
company_data$CompanyName <- "Retail Analytics Pvt Ltd" 
# Display Updated List 
company_data 

#4. Apply class to nested object. 
# Assign S3 Class 
class(company_data) <- "CompanyData" 
# Check Class 
class(company_data) 

#5. Display structure using str(). 
# Display Structure 
str(company_data) 

#Q9) Object-Oriented Data Analysis 
#Scenario: Analyst builds reusable object-based analysis system. 
#1. Convert dataset into S3 object. 
#2. Create function to calculate average income. 
#3. Apply function to object. 
#4. Extend object with new attribute. 
#5. Validate object consistency. 
#1. Convert dataset into S3 object. 
library(readxl) 
# Load Dataset 
# Convert into S3 Object 
customer_object <- data 
class(customer_object) <- "CustomerData" 
# Check Class 
class(customer_object) 

#2. Create function to calculate average income. 
# Function to Calculate Average Income 
average_income <- function(obj) 
{ 
  mean(obj$Income) 
} 
 
#3. Apply function to object. 
# Apply Function 
average_income(customer_object) 
 
# Add New Attribute 
attr(customer_object, "Source") <- "Customer Survey Data" 

# Display Attributes 
attributes(customer_object) 
  
#5. Validate object consistency. 
# Check Object Structure 
str(customer_object) 
# Verify Class 
class(customer_object) 
# Check Missing Values 
sum(is.na(customer_object)) 

#Q10) Enterprise-Level Object System Design 
#Scenario: A company wants scalable object-oriented design. 
#1. Create both S3 and S4 versions of dataset. 
#2. Compare flexibility vs strictness. 
#3. Implement method for summary statistics. 
#4. Document differences between systems. 
#1. Create both S3 and S4 versions of dataset. 
#S3 Object Creation 
library(readxl) 
# Load Dataset 
# Create S3 Object 
s3_customer <- data 
class(s3_customer) <- "CustomerS3" 
# Check Class 
class(s3_customer) 

# Create S4 Class 
setClass( 
  "CustomerS4", 
  slots = list( 
    Age = "numeric", 
    Income = "numeric", 
    Membership = "character" 
  ) 
) 
# Create S4 Object 
s4_customer <- new( 
  "CustomerS4", 
  Age = 35, 
  Income = 65000, 
  Membership = "Gold" 
) 
s4_customer 

#2. Compare flexibility vs strictness. 
# S3 Flexible Assignment 
s3_customer$new_column <- "Flexible" 
# S4 Strict Validation 

#3. Implement method for summary statistics. 
#S3 Summary Method 
# Custom Summary Function for S3 
summary.CustomerS3 <- function(object) 
{ 
  cat("Average Income :", mean(object$Income), "\n") 
  cat("Average Age    :", mean(object$Age), "\n") 
} 
# Apply Summary 
summary(s3_customer) 
#S4 Summary Method 
# Create Summary Method for S4 
setMethod( 
  "summary", 
  "CustomerS4", 
  function(object) 
  { 
    cat("Customer Summary\n") 
    cat("----------------\n") 
    cat("Age        
:", object@Age, "\n") 
    cat("Income     :", object@Income, "\n") 
    cat("Membership :", object@Membership, "\n") 
  } 
) 
# Apply Summary 
summary(s4_customer) 
