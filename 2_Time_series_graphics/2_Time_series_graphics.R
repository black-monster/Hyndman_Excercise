library(fpp)
library(fpp2)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#### 1) Use the help function to explore what the series gold, woolyrnq and gas represent.

help(gold)

help(woolyrnq)

help(gas)
#a. Use autoplot() to plot each of these in separate plots.

autoplot(gold)
autoplot(woolyrnq)
autoplot(gas)
#b. What is the frequency of each series? Hint: apply the frequency() function.
frequency(gold)
frequency(woolyrnq)
frequency(gas)
#c. Use which.max() to spot the outlier in the gold series. Which observation was it?
which.max(gold)
# 770


#### 2) Download the file tute1.csv from the book website, open it in Excel (or some other spreadsheet application), and review its contents. 
#### You should find four columns of information. Columns B through D each contain a quarterly series, labelled Sales, AdBudget and GDP. 
#### Sales contains the quarterly sales for a small company over the period 1981-2005. AdBudget is the advertising budget and GDP is the gross domestic product. 
#### All series have been adjusted for inflation.

#a. You can read the data into R with the following script:
tute1 <- read.csv("tute1.csv", header=TRUE)
View(tute1)
#b. Convert the data to time series.
mytimeseries <- ts(tute1[,-1], start=1981, frequency=4)
# (The [,-1] removes the first column which contains the quarters as we don't need them now.)
#c. Construct time series plots of each of the three series
autoplot(mytimeseries, facets=TRUE)
# Check what happens when you don't include facets=TRUE.
autoplot(mytimeseries, facets=FALSE)

#### 3) Download some monthly Australian retail data from the book website.
#### These represent retail sales in various categories for different Australian states, and are stored in a MS-Excel file.

#a. You can read the data into R with the following script:
retaildata <- readxl::read_excel("retail.xlsx", skip=1)
#The second argument (skip=1) is required because the Excel sheet has two header rows.

#b. Select one of the time series as follows (but replace the column name with your own chosen column):

myts <- ts(retaildata[, "A3349873A"], frequency=12, start=c(1982, 4))

#c. Explore your chosen retail time series using the following functions
#autoplot(), ggseasonplot(), ggsubseriesplot(), gglagplot(), ggAcf()

autoplot(myts)
ggseasonplot(myts)
gglagplot(myts)
help(gglagplot)
ggAcf(myts)
### Still can not understand lagplot.
#Can you spot any seasonality, cyclicity and trend? What do you learn about the series?

#### 4) Create time plots of the following time series: bicoal, chicken, dole, usdeaths, lynx, goog, writing, fancy, a10, h02.
#### *Use help() to find out about the data in each series.
#### *For the goog plot, modify the axis labels and title.
help(bicoal)
autoplot(bicoal)

help(chicken)
plot(chicken)

help(dole)
plot(dole)

help(usdeaths)
plot(usdeaths)

help(lynx)
plot(lynx)

help(goog) # -> not found
plot(goog)

help(writing)
plot(writing)

help(fancy)
plot(fancy)

help(a10)
plot(a10)

help(h02)
plot(h02)
#### 5) Use the ggseasonplot() and ggsubseriesplot() functions to explore the seasonal patterns in the following time series: writing, fancy, a10, h02.
#### *What can you say about the seasonal patterns?
#### *Can you identify any unusual years?

ggseasonplot(writing)
ggsubseriesplot(writing)

ggseasonplot(fancy)
ggsubseriesplot(fancy)

ggseasonplot(a10)
ggsubseriesplot(a10)

ggseasonplot(h02)
ggsubseriesplot(h02)

#### 6) Use the following graphics functions: autoplot(), ggseasonplot(), ggsubseriesplot(), gglagplot(), ggAcf() 
#### and explore features from the following time series: hsales, usdeaths, bricksq, sunspotarea, gasoline.
#### a) Can you spot any seasonality, cyclicity and trend?
#### b) What do you learn about the series?

autoplot(hsales)
ggseasonplot(hsales)
ggsubseriesplot(hsales)
gglagplot(hsales)
ggAcf(hsales)


autoplot(usdeaths)
ggseasonplot(usdeaths)
ggsubseriesplot(usdeaths)
gglagplot(usdeaths)
ggAcf(usdeaths)

autoplot(bricksq)
ggseasonplot(bricksq)
ggsubseriesplot(bricksq)
gglagplot(bricksq)
ggAcf(bricksq)


autoplot(sunspotarea)
ggseasonplot(sunspotarea) -> # Error from here
ggsubseriesplot(sunspotarea)
gglagplot(sunspotarea)
ggAcf(sunspotarea)

autoplot(gasoline) -> # Does not exist.
ggseasonplot(gasoline)
ggsubseriesplot(gasoline)
gglagplot(gasoline)
ggAcf(gasoline)

#### 7) The arrivals data set comprises quarterly international arrivals (in thousands) to Australia from Japan, New Zealand, UK and the US.
#### Use autoplot(), ggseasonplot() and ggsubseriesplot() to compare the differences between the arrivals from these four countries.
#### Can you identify any unusual observations?
autoplot(arrivals)
ggseasonplot(arrivals)
ggsubseriesplot(arrivals)
gglagplot(arrivals)
ggAcf(arrivals)


#### 8) The following time plots and ACF plots correspond to four different time series. 
#### Your task is to match each time plot in the first row with one of the ACF plots in the second row.

#### 9) The pigs data shows the monthly total number of pigs slaughtered in Victoria, Australia, from Jan 1980 to Aug 1995. 
#### Use mypigs <- window(pigs, start=1990) to select the data starting from 1990. 
#### Use autoplot and ggAcf for mypigs series and compare these to white noise plots from Figures 2.17 and 2.18.

mypigs <- window(pigs, start=1990)
autoplot(mypigs)
ggAcf(mypigs)


#### 10) dj contains 292 consecutive trading days of the Dow Jones Index. Use ddj <- diff(dj) to compute the daily changes in the index. 
#### Plot ddj and its ACF. Do the changes in the Dow Jones Index look like white noise?

dj
ddj <- diff(dj)
ggAcf(ddj)

### Yes the differnetiated Dow Jones look like white noise. As around 95% correlation values in the ACF lie within +/- 2/sqrt(T)




















