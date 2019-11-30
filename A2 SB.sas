/* Assignment: CALCULATE MAX,MIN,TOT ACTUAL SALES 
FOR ALL THE COUNTRIES IN THE SASHELP.PRDSAL2 DATASET */

/* Total sale in Each country */
proc sort data=sashelp.prdsal2 out= T1;
BY Country DESCENDING actual;
run;

data totsales;
set t1;
by country;
if first.country then tot_sale=0;
tot_sale+actual;
if last.country;
keep country tot_sale;
run;

/* Min sale in each country */
proc sort data=sashelp.prdsal2 out= T1;
BY Country actual;
run;

data minsale;
set T1;
by country;
if first.country =1 then count=0;
count +1;
keep country actual;
if count eq 1;
run;

/* Max sale in each country */
proc sort data=sashelp.prdsal2 out= T1;
BY Country descending actual;
run;

data maxsale;
set T1;
by country;
if first.country =1 then count=0;
count +1;
keep country actual ;
if count eq 1;
run;

















