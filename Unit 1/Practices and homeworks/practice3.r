#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#1 Calculate Profit As The Differences Between Revenue And Expenses
profit <- revenue - expenses
profit

#2 Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * profit,2) #round(,3)used to decide some decimals will be used 
tax 

#3 Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

#4 Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax/revenue,2) *100
profit.margin <- paste(profit.margin,'%') 
profit.margin #to concatenate characters it is separated by commas and quotation marks are used in the deceased character

#5 Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- mean(profit.after.tax) #The mean is the average of the numbers
mean_pat

#6 Find The Months With Above-Mean Profit After Tax
good.months <- profit.after.tax > mean_pat #with the character> the search for the months greater than the average was mean
good.months

#7 Bad Months Are The Opposite Of Good Months !
bad.months <-  !good.months #!tells us otherwise
bad.months

#8 The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#9 The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min (profit.after.tax)
worst.month

#10 Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0 )
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0) 

#11 Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#12 BONUS:
#Preview Of What's Coming In The Next Section
M <- rbind(revenue.1000,expenses.1000,profit.1000,profit.after.tax.1000,profit.margin,good.months,bad.months,best.month,worst.month)