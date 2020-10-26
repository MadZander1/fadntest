#.................................................................................................#
#
#   Load all csv files from DG-AGRI
#
#.................................................................................................#


#import also other files, fadn.raw.rds to fadn.str.rds

import.fadn.csv(paste0(dg.agri.dir,"ELL2009.csv"),
                fadn.year = 2009,
                fadn.country = "ELL")

import.fadn.csv(paste0(dg.agri.dir,"ELL2010.csv"),
                fadn.year = 2010,
                fadn.country = "ELL")

import.fadn.csv(paste0(dg.agri.dir,"ELL2011.csv"),
                fadn.year = 2011,
                fadn.country = "ELL")

import.fadn.csv(paste0(dg.agri.dir,"ELL2012.csv"),
                fadn.year = 2012,
                fadn.country = "ELL")



# ESP

import.fadn.csv(paste0(dg.agri.dir,"ESP2007.csv"),
                fadn.year = 2007,
                fadn.country = "ESP")

import.fadn.csv(paste0(dg.agri.dir,"ESP2008.csv"),
                fadn.year = 2008,
                fadn.country = "ESP")

import.fadn.csv(paste0(dg.agri.dir,"ESP2009.csv"),
                fadn.year = 2009,
                fadn.country = "ESP")

import.fadn.csv(paste0(dg.agri.dir,"ESP2010.csv"),
                fadn.year = 2010,
                fadn.country = "ESP")

import.fadn.csv(paste0(dg.agri.dir,"ESP2011.csv"),
                fadn.year = 2011,
                fadn.country = "ESP")

import.fadn.csv(paste0(dg.agri.dir,"ESP2012.csv"),
                fadn.year = 2012,
                fadn.country = "ESP")


#check what is loaded
show.data.dir.contents()
