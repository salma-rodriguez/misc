source("/home/chrx/Documents/rmetrics/pkg/RmetricsTools.R")
rmetrics.packages <-pkgsRmetrics()
my.rmetrics.packages <- pkgsRmetrics()[rmetrics.packages %in% rownames(installed.packages())]

Itdv1 = function() {
    if (!("tidyverse" %in% installed.packages()))
        install.packages("tidyverse", dependencies = c("Depends", "Suggests"))
    end
}

peq30 = function() {
    sum(my.rmetrics.packages == rmetrics.packages) == 30 # is it the 30 rmetrics packages we need?
}

mpeq30 = function() {
    if (peq30()) {
        update.packages()
        return(TRUE);
    } else {
        install.packages(rmetrics.packages, repos = "http://R-Forge.R-project.org")
        update.packages()
        return(peq30());
    }
}

# To upgrade R:
#   1. sudo -i R rmpkgs()
#   2. /home/chrx/bash-scripts/r-upgrade.sh -f
#   3. sudo -i R Itdv1(); sudo -i R mpeq30()
rmpkgs = function() {
    unlink(.libPaths(), recursive = T) # remove all R packages
}

restoreCaret = function() {
    install.packages("caret", lib = "/home/chrx/R/x86_64-pc-linux-gnu-library/3.6/", dependencies = c("Depends", "Suggests"))
    library(munsell)
    library(ggplot2)
    library(ModelMetrics)
    library(recipes)
    library(assertthat)
    library(bindrcpp)
    library(glue)
    library(pkgconfig)
    library(DEoptimR)
    library(caret)
}

# if Rmetrics installation fails
# install.packages('package-name',repos='<a class="vglnk" href="http://cran.us.r-project.org" rel="nofollow"><span>http</span><span>://</span><span>cran</span><span>.</span><span>us</span><span>.</span><span>r</span><span>-</span><span>project</span><span>.</span><span>org</span></a>')
# for packages that failed to install, we need to:
# 1. download tar ball with wget
# 2. extract tar ball using tar -zxvf {filename}

sourceDir <- function(path, trace = TRUE, ...) {
    for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
       if(trace) cat(nm,":")
       source(file.path(path, nm), ...)
       if(trace) cat("\n")
    }
}
