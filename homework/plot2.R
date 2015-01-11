# change system attributes
lct <- Sys.getlocale('LC_TIME')
Sys.setlocale('LC_TIME', 'C')

# read data and acquire column names
data_temp <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', nrows = 1)
data <- read.table('household_power_consumption.txt', sep = ';', skip = 66637, nrows = 2880)
names(data) <- names(data_temp)

# make picture
with(data, plot(Global_active_power, type = 'l', xaxt ='n', 
                xlab = '', ylab = 'Global Active Power(kilowatts)'))
axis(1, at = c(0, 1*24*60, 2*24*60), labels = c('Thu', 'Fri', 'Sat')) 

# export to png
dev.copy(png, file = 'plot2.png', width = 480, height = 480, units = 'px')
dev.off()
