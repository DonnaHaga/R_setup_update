# Rsetup.R  
# description: fixes to common problems
# with setup of R, MikTex (Sweave), etc.

# 1. Package libraries
#   On gov workstations, R sets up packages to install automatically in H: and C:/Program Files;
#   this makes R run VERY slow. The solution to this is to change/create the environmental variable
#   R_LIBS_USER from the Windows Control Panel.

.libPaths() # will tell you where R is installing packages

# - Make a folder on your C drive to install packages in: e.g. C:/R_Library (NOT IN PROGRAM FILES)
# - Windows button, "Edit the system environment variables", Environment Variables...(button),
#   New...(button) and then enter the following: 
#         Variable: R_LIBS_USER
#         Variable value: C:/R_Library;C:/Program Files/R/R-3.6.1/library (match to your workstation)
# - Restart
# - Open R and check it worked with .libPaths(): should show the two paths specified in R_LIBS_USER

# WEBSITE REFERENCE FOR ABOVE:
#to change R_USERS_LIB from control panel
"https://stackoverflow.com/questions/31707941/how-do-i-change-the-default-library-path-for-r-packages"

# 2. MikTex Install not detected by R
# https://tex.stackexchange.com/questions/231595/rstudio-cant-find-pdflatex-on-windows-7

# Amend the environmental variable PATH to include MikTeX install:

# See current value of PATH:
Sys.getenv("PATH")

# Add MikTeX install:
Sys.setenv(PATH=paste(Sys.getenv("PATH"),
                      # for workstation NH407579
                      "C:\\Users\\dhaga\\AppData\\Local\\Programs\\MiKTeX\\miktex\\bin\\x64",
                      sep=.Platform$path.sep))

Sys.getenv("PATH")

#restart computer

# 3. Automated reporting
# Note that batch files include path to current R version - path will
# need to be changed when updates occur on reporting computer

#4. Update R:
library(installr)
R.version
updateR()

#5. remove duplicate packages

hLibrary<-dir("//SFP.IDIR.BCGOV/U140/DHAGA$/R/win-library/3.6")
cLibrary<-dir("C:/Program Files/R/R-3.4.2/library")

duplicatePackages<-dplyr::intersect(hLibrary,cLibrary)

# dplyr::setdiff(cLibrary,hLibrary)

# remove duplicate packages from C drive so 
# that packages on H drive can be used from multiple workstations
# ideeally on only base packages get downloaded to C drive
remove.packages(duplicatePackages,
                .libPaths()[1])

# 6. transfer installed packages
# use this to copy over and install packages from one location to another.

# RUN THIS ON OLD WORKSTATION: character vector of all installed packages
packages<-installed.packages("c:/R_Library")[,"Package"]

# save the desired packages to file (only if moving packages between workstations)
saveRDS(packages,
        file="packages.rds")

# RUN THIS ON NEW WORKSTATION: load desired packages (only if moving packages between workstations) 
packages<-readRDS(file.path(getwd(),"packages.rds"))
packages<-readRDS("~/Dropbox/R/R_setup_update/packages.rds")

# find list of missing packages
missingPackages <- packages[!(packages %in% installed.packages()[,"Package"])]

# install missing packages
if(length(missingPackages)) install.packages(pkgs=missingPackages,
                                             lib = "C:/R_library")
# install all packages (use this when you've updated R)
install.packages(pkgs=packages,lib = "C:/R_library")
