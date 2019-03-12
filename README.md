# Extracting_Transforming_Loading-Project

Premise: The Wall Street Journal (WSJ) released data two years ago of reported median starting salaries of graduates from popular schools. Analyzed how these projected median salaries align with graduation rates, as reported by college surveys from The Chronicle of Higher Education College Completion project. 

Extract: The data was formatted as csv files.

Transform: Unnecessary columns were removed, duplicate rows were dropped, and headers were renamed. We also had to manually scan and edit the csvs to ensure that school names matched, since there was no way to determine how to ensure uniformity without having looked at the csvs closely.


Load: The data was loaded into a MySQL database called Colleges, joining on certain shared variables, to create three different tables. This was the quickest and most efficient way of loading the kind of data that was used. 

 The sources of data used for extraction
We used data from The Chronicle of Higher Education and Wall Street Journal hosted on Kaggle. The data from both sources was formatted as csv files. 
https://www.kaggle.com/wsj/college-salaries#salaries-by-college-type.csv
https://collegecompletion.chronicle.com/about/#data
Column definitions provided here:
https://collegecompletion.chronicle.com/wp-content/themes/gates-Microsite/data/data_documentation.txt 

 The type of transformation needed for this data (cleaning, joining, filtering, aggregating.
For the csv files, cleaning and joining were used to transform and manipulate important variables and data. Cleaning was used to rename headers in order to provide a cleaner and more straightforward display in the Colleges database. Then certain columns that did not provide relevant information were removed. Lastly, duplicate rows were dropped.
Joining was done in MySQL. Names of certain headers had to be changed to be able to join correctly and sufficiently. The first table was joined on school id, while the second was on school name. Filtering and using replace were done as needed. 

The type of final production database to load the data into (relational or non-relational).
A relational database (MySQL) was used for the final production. 

The final tables or collections that will be used in the production database.
The final tables are “Salaries”, “Grad_Rates”, and “Demographics.”

Caveats:
The Chronicle of Higher Education data have 3800+ rows, while WSJ has 249 by college type. Because of the nature of the data, we were able to make successful joins across datasets only for 230 colleges/universities. 
Date range wise, it’s not obvious when WSJ data was collected, but we know that the Chronicle data are aggregated percentages and values from 2011 to 2013 self-reported survey data from 3800+ schools. Thus we cannot make any timeframe related conclusions from this project.

Conclusions: 
Does on-time graduation correlate with a higher starting median salary? From cursory views of the data in light of the caveats mentioned above, it is inconclusive, yet possibly correlated. For example, the query: 
SELECT * FROM Colleges.graduation_vs_salaries 
ORDER BY grad_100_percentile DESC 
LIMIT 25;
highlights how many private not-for-profit institutions have high graduation rates (i.e., students graduating on time at or under 4 years at a 4-year institution). The query:
	SELECT * FROM Colleges.graduation_vs_salaries
	ORDER BY median_salary_start DESC 
	LIMIT 25;
also displays many of the same institutions. Yet this is only generalizable to the extent of the WSJ data, which seems to have picked popular and high-ranking institutions as the dataset’s focus instead of being more encompassing to include a wider variety of institutions. Thus further analyses and additional datasets are required to answer this question in greater depth. Yet the datasets brought together here into a MySQL database make a great start as exploratory attempts to answer this question.
