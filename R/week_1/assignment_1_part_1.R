pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        
        #creates a list of files
        fileNames <- list.files(directory, full.names = TRUE)
        data <- data.frame() 
        for (i in id){
               yupy <- read.csv(fileNames[i],  header = TRUE, sep = ",")
               rbind(data, yupy)
        }
        
        mean(data[[pollutant]], na.rm = TRUE)
        
        
        
        
        
        
        
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
#         fileNames <- Sys.glob(paste(c(directory,"/*.csv"),collapse =""))
#         
#         if(length(id)<2){
#                 sample <- read.csv(fileNames[id],  header = TRUE, sep = ",")
#                 q<- mean(sample[[pollutant]],na.rm = TRUE)
#         }
#         if(length(id)>=2){
#                 q<-0
#                 l<-0
#                 for(i in id){
#                         sample <- read.csv(fileNames[i],  header = TRUE, sep = ",")
#                         l<-l + length()
#                         q<- q + sum(sample[[pollutant]], na.rm = TRUE)
#                         
#                 
#                 }
#         }
#         print(mean(q))
#         print(l)
#         print(q/l)
#         
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        
}