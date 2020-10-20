df = read.csv2('household_power_consumption.txt')
df = df[df$Date %in% c('1/2/2007', '2/2/2007'), ]
df$DateTime = paste(df$Date, df$Time)
df$DateTime = as.POSIXct(df$DateTime, format = '%d/%m/%Y %H:%M:%S')
df$Global_active_power = as.numeric(df$Global_active_power)

plot(df$DateTime, df$Global_active_power, type = 'S', 
     xlab = '', ylab = 'Global Active Power (kilowatts)')

dev.copy(png, file = 'plot2.png')
dev.off()
