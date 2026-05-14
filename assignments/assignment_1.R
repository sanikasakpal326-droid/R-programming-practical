#workbook assignment 1 (5-5-26)
#Q.1:Arithmetic Operations + Vector

# Q.1) Arithmetic operations
a <- as.numeric(readline("Enter first number: "))
b <- as.numeric(readline("Enter second number: "))

sum_val   <- a + b
diff_val  <- a - b
prod_val  <- a * b
div_val   <- a / b
power_val <- a ^ b
mod_val   <- a %% b

results <- c(sum_val, diff_val, prod_val, div_val, power_val, mod_val)

print(results)

cat("Maximum:", max(results), "\n")
cat("Minimum:", min(results), "\n")
cat("Average:", mean(results), "\n")   

# Q.2) Numbers and square root processing
n <- as.numeric(readline("Enter how many numbers: "))

# Validation check
if (is.na(n) || n <= 0) {
  stop("Invalid input. Please enter a valid positive number.")
} else {
  nums <- sample(1:100, n)
}

sqrt_val  <- sqrt(nums)
round_val <- round(sqrt_val, 2)
ceil_val  <- ceiling(sqrt_val)
floor_val <- floor(sqrt_val)

df <- data.frame(
  Numbers    = nums,
  SquareRoot = sqrt_val,
  Rounded    = round_val,
  Ceiling    = ceil_val,
  Floor      = floor_val
)

print(df)

# Q.3) Name processing
n <- as.numeric(readline("Enter number of names: "))
names <- character(n)

for (i in 1:n) {
  names[i] <- readline(paste("Enter name", i, ": "))
}

upper_names <- toupper(names)
lengths     <- nchar(upper_names)

result <- paste("Name:", upper_names, "- Length:", lengths)
print(result) 

# Q.4) Number filtering
nums <- 1:200
filtered <- nums[nums %% 3 == 0 & nums %% 5 == 0]

square_root <- sqrt(filtered)
square_val  <- filtered ^ 2

result <- data.frame(
  Number      = filtered,
  SquareRoot  = square_root,
  Square      = square_val
)

print(result)

# Q.5) Quadratic equation
a <- as.numeric(readline("Enter a: "))
b <- as.numeric(readline("Enter b: "))
c <- as.numeric(readline("Enter c: "))

D <- b^2 - 4*a*c

if (D > 0) {
  root1 <- (-b + sqrt(D)) / (2*a)
  root2 <- (-b - sqrt(D)) / (2*a)
  print(c(root1, root2))
} else if (D == 0) {   
  root <- -b / (2*a)
  print(root)
} else {
  cat("Complex roots\n")
}

