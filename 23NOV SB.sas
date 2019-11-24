/* A new variable is always initialized to missing in every iteration */
data IN;
set sashelp.class;
CT= SUM(CT, age);
run;

/* If retain, it will KEEP THAT value*/
data IN;
set sashelp.class;
retain CT;
CT= SUM(CT, age);
run;

data IN;
set sashelp.class;
CT=0;
CT= SUM(CT, age);
run;

data IN;
set sashelp.class;
retain CT 2000;
CT= SUM(CT, age);
run;

data num;
input num@@;
datalines;
1 2 3 4 5
;
run;


data out;
set num;
retain tot 0;
tot= tot+ num;
run;

data num;
input num@@;
datalines;
1 2 . 4 5
;
run;


data out;
set num;
retain tot 0;
tot= tot+ num;
run;

data num;
input num@@;
datalines;
1 2 3 . 5
;
run;


data out;
set num;
retain tot ;
tot= sum(tot, num);
run;
/* IF STATEMENTS */

DATA TEST;
SET sashelp.class;
if age

data test;
x=1000;
if x=1000 then y='A';
if x=2000 then y='BB';
if x=3000 then y='CCC';
if x=4000 then y='DDDD';
ELSE Y='EEEEE';
RUN;

data test;
x=1000;
if x=1000 then y='A';
ELSE if x=2000 then y='BB';
ELSE if x=3000 then y='CCC';
ELSE if x=4000 then y='DDDD';
ELSE Y='EEEEE';
RUN;

/* independent condtn*/
data test;
set sashelp.class;
if age<14;
if age<13;
run;

/* all the if condtns should be true*/
data test;
set sashelp.class;
if age<14;
if age<13;
if age<15;
run;

