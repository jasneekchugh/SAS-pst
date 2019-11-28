/* To get Max Actual Sale of Each Country */
proc sort data=sashelp.prdsal2 out=t1;
by country descending actual;
run;

data test;
set t1;
by country;
if first.country ;
keep country actual;
run;

/*To assign 1-10 to x for each Country */
proc sort data=sashelp.prdsal2 out=t5;
by country ;
run;

data test;
set t5;
by country;
if first.country then x=0;
x+1;
if x le 10;
drop x;
run;

/* To get Sum of Actual Sale of Each Country */
proc sort data=sashelp.prdsal2 out=t5;
by country ;
run;

data test;
set t5;
by country;
if first.country then tot=0;
tot+ actual;
if last.country;
keep country  tot;    
run;

/* To get Sum of actual sales of Top 10 country */
proc sort data=sashelp.prdsal2 out=t5;
by country descending actual;
run;

data test (keep= country actual tot);
set t5;
by country;
if first.country then x=0 and tot=0;
x+1;
if x le 10;
tot+actual;
if x=10;
run;

/* Country year actual sale */
proc sort data=sashelp.prdsal2 out= t1;
by country year;
run;

data t2;
set t1;
by country year;
if first.year=1 then tot_sales=0;
tot_sales+actual;
if last.year;
keep country actual year tot_sales;
run;
