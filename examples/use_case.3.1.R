#+eval=FALSE
#...................................................................................#
#
#   USE CASE 1 example
#
#   Import csv FADN data
#
#...................................................................................#



# In order to use fadnUtils, we must load fadnUtils and data.table
library(fadnUtils)
library(data.table)


# .............. CREATE data.dir ...................................................#

# fadnUtils always work with a user defined data.dir
# Let's assume that the user has not created one yet.
# The following line creates a data.dir folder somewhere in our computer
# We must also have created the raw_str_map.file and pass it as an argument
#   to the function. This file is copied to the data.dir folder. Thus, we can
#   see the structure of the data contained in a data.dir folder by inspecting
#   the raw_str_map.file residing in it.
create.data.dir(
  folder.path = "H:/IFM-CAP/sample.fadnutils.dir",
  raw_str_map.file = "H:/IFM-CAP/version2/data/raw_str_map.after2013_var_names.json"
)

#Once the data.dir is created, we must declare that we are working with it
set.data.dir(
  "H:/IFM-CAP/sample.fadnutils.dir"
)



# .............. IMPORT DATA IN A SINGLE STEP ......................................#

# In order to import the FADN csv files, the simplest way is
#   to use import.fadn.csv.
# We provide the full pat of the csv file and explicitly state
#   the country and the year this file is refering to.
# Using this function, both the csv data is saved in r-data format and the
#   structured r-data are created using the data.dir raw_str_map.file
import.fadn.csv(
  file.path = "H:/IFM-CAP/dg_agri_csv/ELL2007.csv",   #full path of the cvs file
  fadn.country = "ELL",
  fadn.year = 2007
)

# We can import many files (countries, years) in a single data.dir
import.fadn.csv(
  file.path = "H:/IFM-CAP/dg_agri_csv/ESP2007.csv",   #full path of the cvs file
  fadn.country = "ESP",
  fadn.year = 2007
)


#At any time, we can check for the current data dir, what csv files (countries, year)
#   are loaded.
show.data.dir.contents()



# .............. IMPORT DATA IN TWO STEPS ..........................................#

# However you can import the file in two steps, one for converting
#   the csv to fadn.raw.str (csv-data to raw r-data) and
#   one for converting the fadn.raw.rds to fadn.str.rds (raw r-data
#   to structured r-data).


#step 1, convert csv to fadn.raw.rds
convert.to.fadn.raw.rds(
  file.path = "H:/IFM-CAP/dg_agri_csv/ELL2015.csv",
  fadn.country = "ELL",
  fadn.year = 2015
)



# If you check what exists in the data.dir, you will see that
#   only the fadn.raw.rds of ELL-2008 exist
show.data.dir.contents()



#Step 2, convert fadn.raw.rds to fadn.str.rds
convert.to.fadn.str.rds(
  fadn.country = "ELL",
  fadn.year = 2015
)


#check what is loaded
show.data.dir.contents()



# .............. RECALCULATE STRUCTURED DATA  ......................................#

# Let's say that

overwrite.raw_str_map.file(
  data.dir = "H:/IFM-CAP/sample.fadnutils.dir",
  new.raw_str_map.file = "H:/IFM-CAP/version2/data/raw_str_map.after2013_var_names.json"
)






