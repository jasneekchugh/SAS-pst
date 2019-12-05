data test;
input DOB;
informat DOB time8.;
format dob date9.;
DATALINES;
00:00:15
;
RUN;

Data '/folders/myfolders/PST';
input v1$ v2;
datalines;
M 1
F 2
M 3
F 4
;
RUN;
PROC PRINT Data=PST;
run;

Libname PST '/folders/myfolders';

proc means data=sashelp.class;
run;

proc means data=sashelp.class;
Var height;
run;

proc means data=sashelp.class mean mean;
Var height;
run;


proc means data=sashelp.class MEAN PRINTALL;
CLASS SEX;
Var height;
run;

proc means data=sashelp.class P25 P50;
Var height;
run;

proc means data=sashelp.class P37;
Var height;
run;











