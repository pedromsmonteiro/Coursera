complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        fileNames <- list.files(directory, full.names = TRUE)
        data <- data.frame() 
        
        for (i in id){
                files <- read.csv(fileNames[i])
                nocc <- sum(complete.cases(files))
                vectorn <- c(i, nocc)
                data <- rbind(data, vectorn)
        }
        
        colnames(data) <- c('id', 'nobs')
        data
        }