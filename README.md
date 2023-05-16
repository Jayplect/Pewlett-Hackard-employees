## Desciption
I performed a research about people at Pewlett Hackard employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files. For this project, I designed tables to hold the data from the CSV files, imported the CSV files into a SQL database, and then queried the database for some specific information the data. The project work flow used for this project is captured in the chart below:     
<p align="center">
<img align="center" width="600" src =https://github.com/Jayplect/sql-challenge/assets/107348074/8b0ea287-aee2-4725-b3e0-647ac6da8f40> 
</p>
<br clear="both"/>

## Tools Used
<img width="300" align="center" src = https://github.com/Jayplect/sql-challenge/assets/107348074/52b46513-8abe-404f-9553-53b1cbcb9cd8>
<img width="200" align="left" src = https://github.com/Jayplect/sql-challenge/assets/107348074/a3bcafd9-b8c7-4a0a-b805-99fa1a2ab539>

## Project Steps
### Data Modelling
A <a href = https://github.com/Jayplect/sql-challenge/blob/main/EmployeeSQL/conceptual_schema.txt> conceptual schema </a> was created in order to identify relationships amongst the data. The conceptual schema was tansformed into an Entity Relationship Diagram (ERD). I used <a href =https://www.quickdatabasediagrams.com/> QuickDBD </a> app to make the ERD sketch.  In the ERD I identified and showed all primary keys and mapped foreign keys. The foreign mapping included one to many and many to many relationship.
<p align="center">
<img width="700" alt="image" src="https://github.com/Jayplect/sql-challenge/assets/107348074/1bef91b0-6744-43eb-a439-495a9c084e0c">
</p>

### Data Engineering
In this step, I used the information from the ERD to create a <a href =https://github.com/Jayplect/sql-challenge/blob/main/EmployeeSQL/employees_schema.sql>table schema</a> for each of the six CSV files. I also included the primary keys, foreign keys, and other constraints into each of the table schema. To uniquely identify a row, I added a unique constraint to the primary keys. Extra care was taken to create tables in the correct order to handle the foreign keys. Thereafter, I Imported each CSV file into its corresponding SQL table. I also attempted an alternative way to import the csv files into the created tables using <a href =https://www.postgresql.org/docs/current/sql-copy.html> COPY FROM</a> method available in Postgres. However, in other to use this method, it is required to set file permission to <a href =https://www.mssqltips.com/sqlservertip/4542/access-is-denied-error-when-attaching-a-sql-server-database/>Full control</a>. As best practice, at the beginning of the data engineering process, I parsed a query to drop tables before Creating Tables. The CASCADE statement allows tables with foreigns to be dropped.

### Data Analysis
The last step of this project was to query the database using sql SELECT statement in a bid to provide a robust analysis on the following tasks: 
- #1 A list of the employee number, last name, first name, sex, and salary of each employee.
- #2 A list of the first name, last name, and hire date for the employees who were hired in 1986.
- #3 A list of the manager of each department along with their department number, department name, employee number, last name, and first name.
- #4 A list of the department number for each employee along with that employee’s employee number, last name, first name, and department name.
- #5 A list of first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
- #6 A list of each employee in the Sales department, including their employee number, last name, and first name.
- #7 A list of each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
- #8 A list of the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

## Results 
A snapshot of the output of the analysis can be found  <strong> <a href = https://github.com/Jayplect/sql-challenge/tree/main/output_images>here</a> </strong>.

## References
Data generated by Mockaroo, LLCLinks to an external site., (2022). Realistic Data Generator.
