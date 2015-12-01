rankall <- function(outcome, n="best") {
        ## Read outcome data
        data_s <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        outcome_list <- list("heart attack"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                             "pneumonia"="Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia",
                             "heart failure"= "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
        ## Check that state and outcome are valid
        
        #if (!(state %in% data_s$State)){
         #       stop("invalid state")
                
        #}
        
        #if (!(outcome_list[outcome] %in% outcome_list)){
        #        stop("invalid outcome")
                
        #}
        ss <- outcome_list[[outcome]] 
        data_s[,ss] <- as.numeric(data_s[,ss])
        
        ## Return hospital name in that state with lowest 30-day death rate
        aa <- sort(unique(data_s$State))
        framedf <- data.frame()
        
        for(i in aa){
                list_1 <- data_s[data_s$State == i,]
                
                
                list_2<-list_1[order(list_1[[ss]],list_1[["Hospital.Name"]],na.last=NA),]
                
                if(n == "worst"){
                        list_3 <- list_2[!is.na(list_2[[ss]]),]
                        qq <-length(list_3[["Hospital.Name"]])
                        nn <- qq
                        temp<- data.frame(list_2$Hospital.Name[nn], i)
                        framedf <- rbind(framedf,temp)
                        
                }
                else if(n == "best"){
                        
                        nn <- 1
                        temp<- data.frame(list_2$Hospital.Name[nn], i)
                        framedf <- rbind(framedf,temp)

                }
                else{
                nn<-n
                temp<- data.frame(list_2$Hospital.Name[nn], i)
                framedf <- rbind(framedf,temp)
                }
                
        }
        
        colnames(framedf) <-  c("hospital","state")
      
        framedf
        
        
}








