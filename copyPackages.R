# transfer installed packages
# use this to copy over and install packages from one workstation to another.

# check where R is putting packages
.libPaths()

# character vector of all desired packages
packages<-installed.packages("//SFP.IDIR.BCGOV/U140/DHAGA$/R/win-library/3.6")[,"Package"]

# find list of missing packages
missingPackages <- packages[!(packages %in% installed.packages()[,"Package"])]
# install missing packages
if(length(missingPackages)) install.packages(pkgs=missingPackages,
                                             lib = "C:/R_library")