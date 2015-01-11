# change system attributes
lct <- Sys.getlocale('LC_TIME')
Sys.setlocale('LC_TIME', 'C')

# read data and acquire column names
data_temp <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', nrows = 1)
data <- read.table('household_power_consumption.txt', sep = ';', skip = 66637, nrows = 2880)
names(data) <- names(data_temp)

# make picture
with(data, plot(Sub_metering_1, type = 'l', xaxt = 'n', 
                xlab = '', ylab = 'Enerygy sub metering'))
with(data, points(Sub_metering_2, type = 'l', col = 'red'))
with(data, points(Sub_metering_3, type = 'l', col = 'blue'))
axis(1, at = c(0, 1*24*60, 2*24*60), labels = c('Thu', 'Fri', 'Sat'))
legend('topright', lty = 1, col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex = 0.95)

# export to png
dev.copy(png, file = 'plot3.png', width = 480, height = 480, units = 'px')
dev.off()
