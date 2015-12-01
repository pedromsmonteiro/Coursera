rankhospital <- function(state, outcome, n) {
        ## Read outcome data
        data_s <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        outcome_list <- list("heart attack"="Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                             "pneumonia"="Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia",
                             "heart failure"= "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
        ## Check that state and outcome are valid

        if (!(state %in% data_s$State)){
                stop("invalid state")
                
        }
        
        if (!(outcome_list[outcome] %in% outcome_list)){
                stop("invalid outcome")
                
        }
        ss <- outcome_list[[outcome]] 
        ## Return hospital name in that state with lowest 30-day death rate
        list_1 <- data_s[data_s$State == state,]
        list_1[,ss] <- as.numeric(list_1[,ss])
        list_2<-list_1[order(list_1[[ss]],list_1[["Hospital.Name"]],na.last=NA),]
        list_3 <- list_2[!is.na(list_2[[ss]]),]
        if(n == "worst"){
                qq <-length(list_3[["Hospital.Name"]])
                n <- qq
                
        }
        if(n == "best"){
                n <- 1
                
        }
        print(list_2$Hospital.Name[n])
        
        
}
