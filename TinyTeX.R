#https://yihui.org/tinytex/r/

# https://github.com/yihui/tinytex/issues/103

devtools::install_github('yihui/tinytex',force = TRUE)

update.packages(ask = FALSE, checkBuilt = TRUE)
tinytex::tlmgr_update()

tinytex:::is_tinytex()

#Gail
library(tinytex)
tinytex::tlmgr_search('/LGRcmr.fd')
tlmgr_install(c('datetime',
                'fmtcount',
                'sfmath',
                'textgreek',
                'ulem',
                'csquotes',
                'changepage'))

tlmgr_install('changepage')
tlmgr_update()



