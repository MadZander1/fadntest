#+eval=FALSE
#...................................................................................#
#
#   USE CASE 3 example
#
#   Perform analysis
#
#...................................................................................#




# Always load fadnUtils and data.table
library(fadnUtils)
library(data.table)


# The fist step is to set the current data.dir
set.data.dir("H:/IFM-CAP/sample.fadnutils.dir")


# Let's see what countries and years are available for loading
show.data.dir.contents()

#We load structured data for all available countries and years
my.data = load.fadn.str.rds()



# .............. HOW MANY FARMS FOR EACH COUNTY AND EACH YEAR .....................#

# we use the info DT, and group by YEAR-COUNTRY
my.data$info[,.N,by=list(YEAR,COUNTRY)]


#We can also use dcast, to show a more tabular format
dcast(
  my.data$info,
  YEAR~COUNTRY,
  fun.aggregate = length,
  value.var =
)

# We can also export to clipboard, using the write.excel utility function
#   After running the following command, open excel and paste. The result will appear.
write.excel(
  dcast(
    my.data$info,
    YEAR~COUNTRY,
    fun.aggregate = length,
    value.var =
  )
)



# .............. ALL CROP AREAS PER COUNTRY-YEAR ...................................#

# First, calculate the weighted area
my.data$crops[
  VARIABLE=="LEVL",
  VALUE.w:=WEIGHT*VALUE/1000
]

# Then dcast that variable
dcast(
  my.data$crops[VARIABLE=="LEVL"],
  COUNTRY+CROP~YEAR,
  value.var = "VALUE.w",
  fun.aggregate = sum,
  na.rm = T
)



# .............. ALL CROP PRODUCTION PER COUNTRY-YEAR..............................#

dcast(
  my.data$crops[VARIABLE=="GROF",VALUE.w:=WEIGHT*VALUE/1000],
  COUNTRY+CROP~YEAR,
  value.var = "VALUE.w",
  fun.aggregate = sum,
  na.rm = T
)



# .............. BARLEY PRODUCTION PER COUNTRY-YEAR................................#

dcast(
  my.data$crops[
    VARIABLE=="GROF" & CROP=="BARL",
    VALUE.w:=WEIGHT*VALUE/1000
    ],
  COUNTRY~YEAR,
  value.var = "VALUE.w",
  fun.aggregate = sum,
  na.rm = T
)



# .............. DISTRIBUTION OF NUMBER OF CROPS PER COUNTRY-YEAR ..................#

crops.data = my.data$crops #catering for easier access at next steps

#this contains the number of crops for each farm-country-year/
#   Be carefule, we hav to filter to count only the LEVL variable
crops.data.Ncrops = crops.data[VARIABLE=="LEVL",.N,by=list(COUNTRY,YEAR,ID)]

# This displays the quantiles of the number of crops
crops.data.Ncrops[,as.list(quantile(N)),by=list(YEAR,COUNTRY)][order(COUNTRY)]

# R excels on graphic representation of results
library(ggplot2)

ggplot(crops.data.Ncrops,aes(y=N,x=1)) +
  geom_boxplot() +
  facet_grid(YEAR~COUNTRY) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()
        )+
  ylab("Number of Crops")




