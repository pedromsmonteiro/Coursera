pul_a <- function(x){
        a <- list(c(1:10),c(1:20))
        q<- c(0,0)
        for(i in 1:length(a)){
               q[i]<- mean(a[[i]],na.rm = FALSE)
        }
        print(q)
        
}
