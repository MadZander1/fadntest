#+eval=FALSE
#...................................................................................#
#
#   USE CASE 2 example
#
#   Load r-data from a data.dir
#
#...................................................................................#




# Always load fadnUtils and data.table
library(fadnUtils)
library(data.table)


# The first step is to set the current data.dir
set.data.dir("H:/IFM-CAP/sample.fadnutils.dir")


# Let's see what countries and years have been imported in the current data.dir
show.data.dir.contents()


# .............. LOAD RAW R-DATA ..................................................#

# We can either load raw r-data files (the original FADN csv in r-friendly format),
#    or structured r-data files (the original data transformed into meaningful
#    information)


#To load raw r-data, only for Spain (ESP) for 2015
my.data = load.fadn.raw.rds(
  countries = "ESP",
  years = 2015
)

# my.data is a single large data.table, with the original csv columns and rows
nrow(my.data)  #Number of rows
names(my.data)  #Column names
length(names(my.data)) #Number of columns
str(my.data) #Overall structure



# .............. LOAD STRUCTURED R-DATA ...........................................#

#To load structured data, for Spain (ESP) for 2015
my.data = load.fadn.str.rds(
  countries = "ESP",
  years = 2015
)


# You can see that my.data is a list, with three elements: info, costs, crops
str(my.data)

# You can access each individual element like this
str(my.data$info)
str(my.data$costs)
str(my.data$crops)


# The first columns of each of the above elements (info, costs, crops)
#   are created according to the ID section of the raw_str_map
names(my.data$info)
names(my.data$costs)
names(my.data$crops)


# info and costs data.tables are in wide-format (each observation in a single row,
#   all attributes of a single observation in different columns).
# crops element is in long format (one observation is in many rows,
#
#
# See https://seananderson.ca/2013/10/19/reshape/ for
#   discussion of the two types of data formats
head(my.data$info)
head(my.data$costs)
head(my.data$crops)



# Also on the attributes section of each of the above elements, we can access
#   the column formulas and descriptions, as defined in the raw_str_map file.
View(
  attr(my.data$info,"column.descriptions")
)
View(
  attr(my.data$costs,"column.descriptions")
)
View(
  attr(my.data$crops,"column.descriptions")
)


# Especially for the crops element, we can also see the description
#   CROP column
View(
  attr(my.data$crops,"crops.descriptions")
)


# .............. HOW TO LOAD COUNTRIES-YEARS COMBINATIONS  .........................#

# In the previous examples, we showed how to load data for one country and one year
# In the following examples we show more combinations



#To load for Spain (ESP) and Greece (ELL) for year 2015
my.data = load.fadn.str.rds(countries = c("ESP","ELL"), years = 2015)


#To load for Spain (ESP) and Greece (ELL) for all years
my.data = load.fadn.str.rds(countries = c("ESP","ELL"))


#To load all available countries for year 2015
my.data = load.fadn.str.rds(years = 2015)


#To load all availabel data
my.data = load.fadn.str.rds()



# .............. HOW TO STORE THE LOAD  .........................#

# Since loading data sometimes takes time and create big datasets
#   fadUtils offers a way to save the dataset created from the load call

#The first step is to store the loaded data
# Provide the object to save, a name and a description
store.rds.data(my.data,"everything","all countries and years are here")


#You can then close R. The next time you set.data.dir, the stored objects are loaded.
#you can see them in the contents of the data.dir you can see which stored files are there
show.data.dir.contents()



# In order to load back the file
my.data.restored = restore.rds.stored.data("everything")






