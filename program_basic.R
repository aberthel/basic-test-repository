# Author: Ana Berthel
# basic test program
#edited

require(dplyr)
require(xlsx)

rawdata = read.xlsx(file = "data1.xlsx", sheetName = "Sheet1", header = FALSE)
rawdata = na.omit(rawdata)


data_sums = mutate(rawdata, X3 = X1+X2)
ordereddata = arrange(data_sums, X3)

sumtable = summarize(data_sums, avg = mean(X3), sd = sd(X3), min = min(X3), max = max(X3), IQR = IQR(X3), corr = cor(x = X1, y = X2))

write.xlsx(sumtable, file = "outputdata.xlsx", col.names = FALSE, row.names = FALSE)
