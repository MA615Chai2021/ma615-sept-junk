
#Import the Data
IncomePerPerson = read.csv("income_per_person_gdppercapita_ppp_inflation_adjusted.csv", header=T, check.names = FALSE)
PopulationDensity = read.csv("population_density_per_square_km.csv", header=T, check.names = FALSE)


#In order to change the unit of the data and omit "k" later, I make them be characteristic factor
for (i in 1:ncol(IncomePerPerson)) {
  IncomePerPerson[,i] <- as.character( IncomePerPerson[,i])
}
for (i in 1:ncol(PopulationDensity)) {
  PopulationDensity[,i] <- as.character( PopulationDensity[,i])
}

#Merge together, tidy table
data.one = bind_rows(IncomePerPerson, PopulationDensity, .id = "id")
data.one$id[data.one$id == 1] <- "IncomePerPerson"
data.one$id[data.one$id == 2] <- "PopulationDensity"

#Make the "Year" as a column in my dataframe
data_new = gather(data.one, "year", "value", 3:ncol(data.one))

#Adjusting the data with unit "k".
data_new <- na.omit(data_new)
data_new$value[endsWith(data_new$value, 'k')] <- 
  as.numeric(gsub('.{1}$', '', data_new$value[endsWith(data_new$value, 'k')]))*1000

#Converting the df into tibble
data.new <- as.tibble(data_new)




