/* Data Step that calculates Min Age, Max Age and Total Age in SASHELP.CLASS */

Data T1;
Set sashelp.class;
run;

/* For total Age */
Data T1;
SET SASHELP.CLASS end=last;
Total_age+age;
if last;
KEEP TOTAL_AGE;
run;

/* max age */
Data T1;
SET SASHELP.CLASS end=last;
retain max_age;
if age>max_age then max_age=age;
if last;
keep max_age;
run;

/*min age */
Data T1;
SET SASHELP.CLASS end=last;
retain min_age;
if age<max_age then min_age=age;
if last;
keep min_age;
run;
