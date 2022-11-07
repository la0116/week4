#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
df<-HairEyeColor

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(df,1)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(dplyr)

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
df<-as_tibble(df)
df %>% select(Sex,Hair)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
df2<-(df %>% select(Sex,Hair))

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
df2<-df2 %>% select(Hair)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
colnames(df2)[3] = "gender"

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
df_new<-as_tibble(HairEyeColor)
colnames(df_new)[colnames(df_new) == "Sex"] = "gender"

#Let's 'filter' just the females from our dataset
#TASK: Write the function that includes only rows that are 'female'
df_female<-df_new %>% filter(gender=='Female')

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
df_new %>% group_by(gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#TASK: After you run it, write the total here:____
total=mutate(df_new, total=cumsum('Eye'))

#Since we have a females dataset, let's make a males dataset
#TASK: Write the function that includes only rows that are 'male'
df_male<-df_new %>% filter(gender=='Male')

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
df_total<-union(df_female,df_male)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
df_total%>%distinct(Eye)
df_total%>%arrange(desc(n),Eye)
