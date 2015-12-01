library(sqldf)

file <- "household_power_consumption.txt"
sql_st <- "SELECT * FROM file WHERE substr(Date,5)||substr(Date,3,1)||substr(Date,1,1) between '200721' and '200722';"
dados <- read.csv.sql(file , sql = sql_st, header = TRUE, sep= ";")

dados$Date <- as.Date(dados$Date, format = "%d/%m/%Y")
dados$datetime <- strptime(paste(dados$Date, dados$Time,  sep = " "), format = "%d/%m/%Y %H:%M:%S")


hist(dados$Date, )


