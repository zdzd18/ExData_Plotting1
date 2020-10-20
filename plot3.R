df = read.csv2('household_power_consumption.txt')
df = df[df$Date %in% c('1/2/2007', '2/2/2007'), ]
df$DateTime = paste(df$Date, df$Time)
df$DateTime = as.POSIXct(df$DateTime, format = '%d/%m/%Y %H:%M:%S')
df$Sub_metering_1 = as.numeric(df$Sub_metering_1)
df$Sub_metering_2 = as.numeric(df$Sub_metering_2)
df$Sub_metering_3 = as.numeric(df$Sub_metering_3)

plot(df$DateTime, df$Sub_metering_1, type = 'S', 
     xlab = '', ylab = 'Energy sub metering')
lines(df$DateTime, df$Sub_metering_2, type = 'S', col = 'red')
lines(df$DateTime, df$Sub_metering_3, type = 'S', col = 'blue')
legend('topright', lty = 1, cex = 0.8, 
       col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.copy(png, file = 'plot3.png')
dev.off()
