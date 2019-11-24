proc means data=sashelp.class p25 p50 p75;
var weight;
run;

proc print data=sashelp.class;
run;

proc rank data=sashelp.class groups=4;
run;

proc rank data=sashelp.class out= jasneek groups=4;
var weight;
run;

proc rank data=sashelp.class out=jasneek groups=4;
var weight;
ranks weight_rank;
run;

proc means data=jasneek min max;
var weight;
run;

proc means data=jasneek min max;
class weight_rank;
var weight;
run;

proc rank data=sashelp.class out= '/folders/myfolders/Jasneek' groups=4 descending;
var weight;
ranks weight_rank;
run;

Data PST;
input v1 v2;
datalines;
1 1
2 0
3 1
4 0
5 1
6 0
7 1
8 0
9 1
10 0
;
run;

proc means data=PST;
RUN;

PROC MEANS data=pst p1 p5 p10 p25 p30 p40 p50 p60 p70 p75 p80 p90;
run;

Data abc;
input v1 ;
datalines;
1 
2 
3 
4 
5 
6 
7 
8 
9 
.
11
12
13
14
15
16
17
18
19
-20
;
run;
proc sort data=abc;
by v1;
run;

proc means data=abc;
var v1;
run;

/* It will not consider missing value for means. Like it will 
divide by 4 and not 5 for the mean (N=4) */
/* While running a PROC missing values don't participate */
Data ab;
input v1 ;
datalines;
1 
2 
3 
4
.
;
run; 
proc means data=ab;
var v1;
run;


















