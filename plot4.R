df = read.csv2('household_power_consumption.txt')
df = df[df$Date %in% c('1/2/2007', '2/2/2007'), ]
df$DateTime = paste(df$Date, df$Time)
df$DateTime = as.POSIXct(df$DateTime, format = '%d/%m/%Y %H:%M:%S')

df$Global_active_power = as.numeric(df$Global_active_power)
df$Global_reactive_power = as.numeric(df$Global_reactive_power)
df$Voltage = as.numeric(df$Voltage)
df$Sub_metering_1 = as.numeric(df$Sub_metering_1)
df$Sub_metering_2 = as.numeric(df$Sub_metering_2)
df$Sub_metering_3 = as.numeric(df$Sub_metering_3)

png("plot4.png", width=480, height=480, res = 72)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(df$DateTime, df$Global_active_power, type = 'S', 
     xlab = '', ylab = 'Global Active Power')
plot(df$DateTime, df$Voltage, type = 'S', 
     xlab = 'datetime', ylab = 'Voltage')

plot(df$DateTime, df$Sub_metering_1, type = 'S', 
     xlab = '', ylab = 'Energy sub metering')
lines(df$DateTime, df$Sub_metering_2, type = 'S', col = 'red')
lines(df$DateTime, df$Sub_metering_3, type = 'S', col = 'blue')
legend('topright', lty = 1, cex = 0.8, bty = 'n', 
       col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(df$DateTime, df$Global_reactive_power, type = 'S', 
     xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()
