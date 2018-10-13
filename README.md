# eda
Exploratory Data Analysis
Guidelines:
- **Granularity** – Daily/Weekly/Statewise/Citywise/Item level/match level/ball level
- **Data Types**
  - General types: Category, Numerical, Location, Text, Date, Misc
	- Special types: IDs, Phone numbers, URL, Names
- **Derived Metrics**
	- Date: 
    - Month, Day, Year, Hour, Minute, Second
	  - Afternoon, Morning
	  - Weekday, Week number, Quarter
	  - Season, age, weekday, weekend
  - Location
    GDP, Area, Population, Continent, Time zone, Major Language, Total language, Major religion, Ruling party, count of major parties
	  Currency, Literacy rate, Gender ratio, Unemployment ratio
  - Email ID, Domain
	  Server, Length of the email address, Special Character (Yes/No)
	- Name
	  First Name, Sur Name, Gender
	- Images
	  Object, RGB ratio, Theme color, 
  - Text
	  No. of characters, words, sentences, Most repeating word, Noun from the text
	- Numerical columns: Binning
- Reclassify your data types
- Identify percentage of missing values
- Identify percentage of outliers for numerical columns
- Identify those columns which might not be useful for analysis
- **Univariate Analysis**
	- Category: Frequency distribution to check what percentage of levels contribute to 80% of the frequency
	- Numerical: Box plot & histogram to identify distribution and outliers
	- Text: Bag of words - wordcloud. Also derive new columns based on top words
	- Location: Get lat,lon and visualize them using darrinward API
	- Date: Derive metrics like year, month, day, weekday, quarter etc
- **Bivariate Analysis**
  - Numerical columns – Correlation Analysis
  - One categorical column & one numerical column – Segmented analysis - T-test or ANNOVA
  - Two categorical column – Crosstab - Chi-square test

- **Dimension Reduction**

### Techniques
- Frequency distribution on Categorical Columns
	- Identify unique no. of levels
	- For each level identify the frequency
	- Sort the levels based on frequency (descending order)
	- For each level calculate the %of Freq. 
	- Calculate cumulative sum of these %of Freq
	- Draw the line chart
	- X axis – levels
	- Y axis - % of freq
	- Check how many levels contribute to 80% of frequency
	- Compute what is the percentage of these levels. If it is less than 25% or so, it is a good pattern to report
- Numerical column: Distribution using box plot
	- Q1, Q2, Q3, IQR = Q3-Q1
	- Using IQR
	  - Lower whisker -> Q1 – 1.5*IQR
	  - Upper whisker -> Q3 + 1.5 * IQR
	- Using percentiles
	  - Lower whisker -> 2 percentile
	  - Upper whisker -> 98 percentile
	- Identify total number of values which are below the lower whisker and above upper whisker
	- Compute % of outliers
- Correlation Analysis
	- Is a measure of linear association between two numerical variables
- PCA Process
	- Standardized input variables
	    - Mean of all cols = 0, Var & Standard Deviation = 1
	    - To compare columns with different units
	- Compute correlation matrix
	- Idenfity Eigen values and vectors
	- Identify how many PCs to retain to store 95% of the information
	- Create PCA model with so many principal components
	- Properties of PCS
	    - All PC are orthogonal to each other; Correlation will be zero
	    - Variance of each PC is equal to variance of the eigen values (desc)
	    - No two PCs share same information
	    - var(PC1) > var(PC2) > var(PC3)....
	- Purpose of PCA?
	    - **Dimension Reduction**: Do not reconstruct. Just pass PCs to ML model
	    - **Data compression**: Store PCs and their eigen vectors
	    - **Noise removal**: Reconstruct your orginal signal
