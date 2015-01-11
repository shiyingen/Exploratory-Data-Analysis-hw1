# change system attributes
lct <- Sys.getlocale('LC_TIME')
Sys.setlocale('LC_TIME', 'C')

# read data and acquire column names
data_temp <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', nrows = 1)
data <- read.table('household_power_consumption.txt', sep = ';', skip = 66637, nrows = 2880)
names(data) <- names(data_temp)

# make picture
par(mfrow = c(1, 1))
with(data, hist(Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Action Power'))

# export to png
dev.copy(png, file = 'plot1.png', width = 480, height = 480, units = 'px')
dev.off()