# fileManagement.R

dir<-"\\\\SFP.IDIR.BCGOV\\U140\\DHAGA$\\Profile\\Desktop\\dDriveBackup"

dir(dir)

# delete directory:
unlink(dir,recursive = TRUE)

dir("D://")

file.copy("D://",dir,recursive = TRUE)

#backup folder to another location
dir.create("H:/HagaR_backup")
file.copy(from="C:/HagaR",
          to="H:/HagaR_backup",
          recursive = TRUE)
