
# PART 2

# Creating a vector:

1.
vector <- c(1, "hello", FALSE)
vector
[1] "1"     "hello" "FALSE"

2.
odd <- c(1,3,5,7,9)
even <- c(2,4,6,8,10)

***************************

# Naming a vector:

name_and_profession <- c("Tom", "Doctor", "Peter", "Engineer", "Harry", "Butcher")
names(name_and_profession) <- c("Name", "Profession", "Name", "Profession", "Name", "Profession")

name_and_profession

Output:

Name Profession       Name Profession       Name Profession 
     "Tom"   "Doctor"    "Peter" "Engineer"    "Harry"  "Butcher" 

***************************

# Two become one:

Vector1 <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120)
Vector2 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
total = Vector1 + Vector2
total

 [1]  11  22  33  44  55  66  77  88  99 110 121 132

***************************

# Computing vectors:

Vector1 <- c(2, 5, 9, 3)
sum(Vector1)

***************************

# Comparing Vectors:

#1.
Vector1 <- c(48, 66, 99)
Vector2 <- c(79, 90, 81)

Output:

Your program did not output anything!


#2.
sum(Vector1) < sum(Vector2)
[1] TRUE

sum(Vector2) <= sum(Vector1)
[1] FALSE

sum(Vector2) > sum(Vector1)
[1] TRUE

sum(Vector1) >= sum(Vector2)
[1] FALSE

sum(Vector1) == sum(Vector2)
[1] FALSE

sum(Vector1) != sum(Vector2)
[1] TRUE

***************************

# Vector Indexing:

Dwarves <- c("Doc", "Grumpy", "Happy", "Sleepy", "Dopey", "Bashful", "Sneezy")

#Select Grumpy
Dwarves[2]
[1] "Grumpy"

#Select all except Dopey
Dwarves[-5]
[1] "Doc"     "Grumpy"  "Happy"   "Sleepy"  "Bashful" "Sneezy" 

#Select Sleepy
Dwarves[4]
[1] "Sleepy"

#Select all except Happy
Dwarves[-3]
[1] "Doc"     "Grumpy"  "Sleepy"  "Dopey"   "Bashful" "Sneezy" 

#Select Grumpy, Happy, Sleepy and Dopey
Dwarves[2:5]
[1] "Grumpy" "Happy"  "Sleepy" "Dopey" 

#Exclude Sneezy, Dopey and Happy
Dwarves[c(-3,-5,-7)]
[1] "Doc"     "Grumpy"  "Sleepy"  "Bashful"

#Select Grumpy, Bashful and Doc
Dwarves[c(2,6,1)]
[1] "Grumpy"  "Bashful" "Doc"

#Select Dopey, Bashful and Sneezy
Dwarves[5:7]
[1] "Dopey"   "Bashful" "Sneezy" 

#Select Doc, Grumpy, Happy, Bashful and Sneezy
Dwarves[c(1,2,3,6,7)]
[1] "Doc"     "Grumpy"  "Happy"   "Bashful" "Sneezy" 


