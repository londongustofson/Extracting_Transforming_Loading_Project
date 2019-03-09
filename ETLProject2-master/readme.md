Project Topic: Graduation rates and projected median starting salaries by college 

The sources of data used for extraction

We used data from The Chronicle of Higher Education and Wall Street Journal hosted on Kaggle. The data from both sources was formatted as csv files. 
https://www.kaggle.com/wsj/college-salaries#salaries-by-college-type.csv
https://collegecompletion.chronicle.com/about/#data
Column definitions provided here:
https://collegecompletion.chronicle.com/wp-content/themes/gates-Microsite/data/data_documentation.txt 

The type of transformation needed for this data (cleaning, joining, filtering, aggregating).
 
For the csv files, cleaning and joining were used to transform and manipulate important variables and data. Cleaning was used to rename headers in order to provide a cleaner and more straightforward display in the Colleges database. Then certain columns that did not provide relevant information were removed. Lastly, duplicate rows were dropped.
Joining was done in MySQL. Names of certain headers had to be changed to be able to join correctly and sufficiently. The first table was joined on school id, while the second was on school name. Filtering and using replace were done as needed. 

The type of final production database to load the data into (relational or non-relational).

A relational database (MySQL) was used for the final production. 

The final tables or collections that will be used in the production database.

The final tables are “Salaries”, “Grad_Rates”, and “Demographics.”

Please see for full report: https://docs.google.com/document/d/1ajsw7HrEMvD1CezPj48RUXafJxHaKi0htjLzHhTU5Og
