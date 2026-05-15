Q.1
df <-data.frame(
  name = c("Raj","Amit","Neha","raj","Amit"),
  marks= c("80","90",NA,"85","90"),
  city = c("Pune","pune","Mumbai","PUNE","Mumbai")
)

#1)Remove extra spaces from the name column
df$name <- trimws(df$name)

#2)Convert all names to lowercase
df$name <- tolower(df$name)

#3)3) Convert marks column to numeric and handle missing values
df$marks <- as.numeric(df$marks)
df$marks[is.na(df$marks)] <- mean(df$marks, na.rm = TRUE)

#4)4) Standardize city names (all lowercase)
df$city <- tolower(df$city)

#5)5) Filter students with marks greater than 80
df_filtered <- subset(df, marks > 80)

#6)6) Create a new column grade
df_filtered$grade <- ifelse(df_filtered$marks >= 85, "A", "B")

print(df_filtered)

Q.3

# 1  Create Dataset
data <- data.frame(
  gender = c('male','female','male','female','male','female'),
  purchase = c('yes','no','yes','yes','no','yes'),
  amount = c(5000,7000,8000,6000,4000,9000)
)

print(data)

# 3. Calculate Mean of Amount
mean_amount <- mean(data$amount)
print(mean_amount)

# 4. Frequency Table for Gender
freq_gender <- table(data$gender)
print(freq_gender)

# 5. Cross Tabulation of Gender and Purchase
cross_tab <- table(data$gender, data$purchase)
print(cross_tab)

# 6. Find Total Purchase Amount
total_amount <- sum(data$amount)
print(total_amount)

# 7. Count Number of Yes Purchases
yes_count <- sum(data$purchase == "yes")
print(yes_count)