# svg_europe

The R script file is divided into the following sections:</br>
1. loading the libraries and initial raw data</br>
2. Assigning colors to the data</br>
3. Assigning the 2 letter Euro country code</br>
4. Binding ALL THE DATA and filtering it </br>
5. Generate the css style tags for the svg.

### loading the libraries and initial raw data:
We will use the dplyr library for data manipulation. The initial raw data can be read in R using the read.csv() function in R.

### Assigning colors to the data:
We would like to color each country based on the debt to gdp ratio. Hence we will divide the data based on 6 buckets. The breaks used for the analysis are 25%, 60%, 75%, 100%, 160% and 190%.   The cut() function is utilized for breaking the data into buckets defined under brks object. Further, we will label each bucket based on a color. The color scheme used for the post is from http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3.

### Assigning the 2 letter Euro country code:
If we open the svg file all the countries in the svg are identified using a 2 digit code. However, the data file comprises of data coded with a 3 digit country code. We thus use a gsub() function to generate a column that is a list of 2 digit country code.

### Binding all the data and filtering it:
Here we will bind 3 sets of data together using the cbind() function. The first set is the entire data from OECD, the second set is a column of colors assigned based on buckets and lastly the 2 digit country code. Once we have the entire data set ready we will use the filter() from the dplyr library to only get debt to gdp ratio of european countries for 2015.

### Generate the css style tags for the svg:
We would like to generate a css style tag which looks something like : #at {fill : #af8dc3 !important }. Hence we will use a combination of loop and paste function to generate a list of tags based on the data from year 2015. Finally, we will write the list of output to a csv file using the write.csv() function in R.
