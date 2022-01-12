
# PART 3

# Enter the Matrix:

#1.
matrix(1:9, nrow=3)

Output:
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9


#2.
matrix(1:6, nrow=2)

Output:
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

***************************

# Analyzing Matrices:

# Fruit Stand Sales (in kgs)
apples <- c(17, 22, 14, 7 ,36 )
oranges <- c(32, 42, 22,2, 12)
bananas <- c(20, 15, 36, 11, 14)
total_sales <- c(apples,oranges, bananas)
total_sales_matrix <- matrix(total_sales, byrow = TRUE, nrow = 3)
total_sales_matrix

Output:
     [,1] [,2] [,3] [,4] [,5]
[1,]   17   22   14    7   36
[2,]   32   42   22    2   12
[3,]   20   15   36   11   14

***************************

# Labels are Important:

#1.
# Fruit Stand Sales (in kgs)
apples <- c(17, 22, 14, 7 ,36 )
oranges <- c(32, 42, 22,2, 12)
bananas <- c(20, 15, 36, 11, 14)
total_sales <- c(apples,oranges, bananas)
total_sales_matrix <- matrix(total_sales, byrow = TRUE, nrow = 3)

#2.
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

#3.
fruits <- c("Apples", "Oranges", "Bananas")

#4.
colnames(total_sales_matrix) <- days

#5.
rownames(total_sales_matrix) <- fruits

#6.
total_sales_matrix

Output:

        Monday Tuesday Wednesday Thursday Friday
Apples      17      22        14        7     36
Oranges     32      42        22        2     12
Bananas     20      15        36       11     14

***************************

# Hacking the Matrix:

# Fruit Stand Sales (in kgs)
apples <- c(17, 22, 14, 7 ,36 )
oranges <- c(32, 42, 22,2, 12)
bananas <- c(20, 15, 36, 11, 14)
total_sales <- c(apples,oranges, bananas)
total_sales_matrix <- matrix(total_sales, byrow = TRUE, nrow = 3)

days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
fruits <- c("Apples", "Oranges", "Bananas")

colnames(total_sales_matrix) <- days
rownames(total_sales_matrix) <- fruits

total_sales_matrix

#1.
total_sales_day <- colSums(total_sales_matrix)
total_sales_day

Output:

   Monday   Tuesday Wednesday  Thursday    Friday 
       69        79        72        20        62 

#2.
total_sales_fruit <- rowSums(total_sales_matrix)
total_sales_fruit

Output:

 Apples Oranges Bananas 
     96     110      96 

#3.
avg_per_day <- mean(total_sales_day)
avg_per_day

Output:

[1] 60.4

#4.
avg_per_type <- mean(total_sales_fruit)
avg_per_type

Output:

[1] 100.6667

#5.
lemons <- c(49, 39, 17, 33, 9)
kiwis <- c(36, 19, 47, 27, 35)
mangoes <- c(10, 31, 16, 4, 24)
total_sales2 <- c(lemons, kiwis, mangoes)
total_sales_matrix2 <- matrix(total_sales2, byrow=TRUE, nrow=3)

#6.
fruits2 <- c("Lemons", "Kiwis", "Mangoes")
rownames(total_sales_matrix2) <- fruits2

#7.
all_sales_matrix <- rbind(total_sales_matrix, total_sales_matrix2)

#8.
all_sales_matrix

Output:

        Monday Tuesday Wednesday Thursday Friday
Apples      17      22        14        7     36
Oranges     32      42        22        2     12
Bananas     20      15        36       11     14
Lemons      49      39        17       33      9
Kiwis       36      19        47       27     35
Mangoes     10      31        16        4     24

