# importing the dataset
library(haven)
library(plotly)
Solardata <- read_sav("C:/Users/USER/Desktop/Steven Projects/archive/SolarEnergy_Adoption/Data/Solardata.sav")
View(Solardata)

# insatll plyr package if necessary
if (!require(plyr)) install.packages("plyr")
library(plyr)

# Re-level the Gender column with desired labels
Solardata$Gender <- factor(Solardata$Gender, levels = c(0, 1), labels = c("Female", "Male"))

#frequencies of Gender
summary(Solardata$Gender)


# Calculate the count of each gender
gender_counts <- table(Solardata$Gender)

# Create a pie chart
gender_pie <- plot_ly(labels = names(gender_counts), values = gender_counts, type = "pie",
                      marker = list(colors = c("blue", "pink")))

# Customize the layout
gender_pie <- gender_pie %>% layout(title = "Gender Distribution")

# Show the plot
gender_pie
