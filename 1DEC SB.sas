/* Refer to Screenshot 01DEC SB */

proc sort data=sashelp.prdsal2 out=outputa;
by country state descending actual;
run;

/* 1.1 $1469 */

/* 1.2 $1096 */

/*1.3 (a)*/
proc sort data=sashelp.prdsal2 out=outputb nodupkey;
by state;
run;

/*1.3 (b)*/
proc sort data=sashelp.prdsal2 out=outputb;
by country state descending predict;
run;

data test;
set outputb;
by country state;
if first.state;
keep country state predict;
run;

/* 1.4 (c) */
proc sort data=sashelp.prdsal2 out=outputb;
by predict;
run;

/* 1.5 */
proc means data=














