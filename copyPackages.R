# transfer installed packages
# use this to copy over and install packages from one workstation to another.

# check where R is putting packages
.libPaths()

# character vector of all desired packages -> RUN THIS ON OLD WORKSTATION
packages<-installed.packages("C:/R_library")[,"Package"]

# find list of missing packages -> RUN THIS ON NEW WORKSTATION
missingPackages <- packages[!(packages %in% installed.packages()[,"Package"])]

# install missing packages
if(length(missingPackages)) install.packages(pkgs=missingPackages,
                                             lib = "C:/R_library")