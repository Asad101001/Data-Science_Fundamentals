m3 <- matrix(c("apple", "banana", "cherry", "orange", "grape", "mango", "pineapple", "watermelon"), nrow = 3, ncol = 2)
m3

#CHECK IF ITEM EXISTS
"apple" %in% m3
"banana" %in% m3

#Check number of rows and columns
dim(m3)

#Matrix length
length(m3)

#Combining matrices
Matrix1 <- matrix(c("apple", "banana", "cherry", "grape"), nrow = 2, ncol = 2)
Matrix2 <- matrix(c("orange", "mango", "pineapple", "watermelon"), nrow = 2, ncol = 2)

##ADD AS ROWS
Matrix_Combined <- rbind(Matrix1, Matrix2)
Matrix_Combined

##ADD AS COLUMNS
Matrix_Rombined <- cbind(Matrix1, Matrix2)
Matrix_Rombined

#ARRAYS
# Array of one dimension from 1 to 24
array1 <- c(1:24)
array1

# Array with more than one dimension
multiarray <- array(array1,dim = c(4,3,2))
multiarray

#ACCES AN ITEM FROM ARRAY
multiarray[2,3,2]      #Means 2nd row 3rd cell in 2nd matrix

thisarray <- c(1:24)

multiarray1<- array(thisarray, dim = c(4, 3, 2))
multiarray1
multiarray1[c(1),,1]

#CREATING DATAFRAME
students <- data.frame(
  Name = c("Alice", "Charlie", "Matilda", "Robinson", "Jack"),
  Age = c(15, 16, 15, 17, 16),
  Score = c(85, 90, 78, 88, 92)
)
print(students)

#DISPLAY STRUCTURE
str(students)

#EXTRACT AGE COLUMN
students$Age

#FILTER ROWS WHERE SCORE IS GREATER THAN
students[students$Score > 80, ]

#CREATE NEW DATA FRAME WITH STUDENTS AGED 16 or OLDER
subset(students, Age >= 16)

#READ DATA FROM A CSV FILE
data <- read.csv("data.csv")
print(data)

#WRITE DATAFRAME TO A NEW CSV FILE
write.csv(students, "output.csv", row.names