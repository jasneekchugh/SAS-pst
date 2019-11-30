proc sort data=sashelp.prdsal2 out=t1;
by country;
run;

DATA pst;
set t1;
By country;
if first.country=1 then tot_sales=0;
tot_sales+ actual;
if last.country=1;
keep country tot_sales;
format tot dollar15.3;
run;

/* count of unique countries */
proc sort data=sashelp.prdsal2 out=t1;
by country;
run;

DATA pst;
set t1 end=last;
By country;
if first.country= 1 then count+1;
keep  count;
if last=1;
run;

/* To get sum of sales in each counry, state wise*/
proc sort data=sashelp.prdsal2 out=t1;
by country state;
run;

DATA pst;
set t1;
By country state;
if first.state= 1 then tot_sales=0;
tot_sales+ actual;
if last.state;
keep country state tot_sales;
run;

/* To get Max sales in Each country */
proc sort data=sashelp.prdsal2 out=t1;
by country descending actual;
run;

DATA pst;
set t1;
By country ;
if first.country= 1;
keep country  actual;
run;

/* IMP- To get the sum of Top 10 Actual sales in Each country*/
proc sort data=sashelp.prdsal2 out=t1;
by country descending actual;
run;

DATA pst;
set t1 ;
By country ;
if first.country=1 then COUNT=0;
COUNT +1;
KEEP COUNTRY ACTUAL COUNT;
IF COUNT LE 10;
RUN;



