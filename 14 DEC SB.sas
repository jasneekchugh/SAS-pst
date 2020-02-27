
Data Student_subjects;
length major $200;
input id Major $ &;
datalines;
1001 Computer Science and Math
1002 Business Administration and Computer Science
1003 Political Science
1004 Physics
1005 History and Chemistry
1006 Political Science and History
1007 Math and Physics
1008 Political Science and Computer Science
;
run;

data t1;
x = 'Data Data Data Data proc Data';
y = find(x, 'DATA', 10);
run;


/* ------------------------------------------- */
/* combining data : one to one  */

Data D1;
input num  var1 $;
datalines;
1 x1
2 x2
3 x3
4 x4
;run;
Data D2;
input num  var2 $;
datalines;
1 y1
2 y2
3 y3
4 y4
;run;
data test;
set d1;
set d2;
run;




Data D1; input num $1. var1 $ @@; 
datalines;
1 x1 2 x2 3 x3 4 x4
;run;
Data D2; input num $2. var2 $ @@;
datalines;
1a y1 2b y2 3g y3 4d y4
;run;

data test;
set d2;
set d1;
run;





data test;
set d1;
set d2;
run;







Data D1; input num $1. var1 $ @@;
datalines;
1 x1 2 x2 3 x3 4 x4
;run;
Data D2; input num $3. var2 $ @@; 
datalines;
11  y1 222 y2 33  y3
;run;

data test;
set d1;
set d2;
run;






data first;
x= 'Bangalore'; output;
y = 'New york'; output;
x= 'Mumbai'; y = 'St. Louise';
run;

data last;
x= 'Delhi'; y = 'Jaipur';
output;
run;

data d3;
set last;
set first;
run;


/* Please combine tot age with sashelp.class dataset and display total age with all 19 observations */



/*concatenation*/

Data D1; input num var1 $; datalines;
1 x1
2 x2
3 x3
4 x4
;run;
Data D2; input num  var1 $; datalines;
11 y1
222 y2
33 y3
2A y4
;run;

data test2;
set d1 d2;
run;




Data D1; input num1 var1 $ @@; 
datalines;
1 x1 2 x2 3 x3 4 x4
;run;
Data D2; input num2  var2 $ @@; 
datalines;
11 y1 222 y2 33 y3 2A y4
;run;

data test2;
set d1 d2;
run;


data test2;
set d1 d2( rename = (num2 = num1 var2 = var1));
run;


data test2;
set d1 d2;
rename  num2 = num1 var2 = var1;
run;





Data D1; input num  var1 $ @@; 
datalines;
1 x1 2 x2 3 x3 4 x4
;run;
Data D2; input num var2 $ @@; 
datalines;
11 y1 22 y2 33 y3 2A y4
;run;

data last;
x= 'Delhi'; y = 'Jaipur';
run;

data PST;
set d1 d2;
set last;
run;




Data D1; input num  var1 $ @@; 
datalines;
1 x1 2 x2 3 x3 4 x4
;run;
Data D2; input num var1 $ @@; 
datalines;
11 y1 22 y2 33 y3 2A y4
;run;


/*appending*/
proc append base = d1 data = d2;
run;






Data D1;
input num var1 $;
datalines;
1 x1
2 x2
3 x3
4 x4
;run;
Data D2;
input num  var2 $;
datalines;
11 y1
222 y2
33 y3
44 y4
;run;

proc append base = d1 data = d2  ;
run;




proc append base = d1 data = d2 force ;
run;






Data D1;
input num $1. var1 $ @@;
datalines;
1 x1 2 x2 3 x3 4 x4
;run;

Data D2;
input num  $3. var1 $ @@;
datalines;
11 y1 222 y2 33 y3 44 y4
;run;


proc append base = d1 data = d2 ;
run;


proc append base = d2 data = d1 ;
run;



Data D1;
input num $2. var1 $ @@;
datalines;
1 x1 2 x2 3 x3 4 x4
;run;
Data D2;
input num $2. var1 $  var2 $ @@;
datalines;
11 y1 X1 22 y2 X2 33 y3 X3 44 y4 X4
;run;


proc append base = d2 data = d1;
run;



/* Interleaving */

Data D1; input num  var1 $; datalines;
1 x1
2 x2
5 x3
7 x4
;run;
Data D2; input num var1 $; datalines;
2 y1
2 y2
6 y3
8 y4
;run;

data test2;
set d1 d2;
by num;
run;



data test;
input num @@; 
datalines; 
1 . 3 . 5
;run;

data PST;
input num @@; 
datalines; 
11 22 33 44 55
;run;

data All;
set test;
if num = . then set PST;
run;






/*Merging*/
Data D1;
input num  var1 $;
datalines;
1 x1
2 x2
3 x3
4 x4
;run;
Data D2;
input num  var2 $;
datalines;
1 y1
2 y2
3 y3
4 y4
;run;

Data test;
merge d1 d2;
by num;
run;





Data D1; input num  var1 $; datalines;
1 x1
2 x2
5 x3
;run;
Data D2; input num  var2 $; datalines;
1 y1
3 y3
4 y4
;run;

Data test;
merge d1 d2;
by  num ;
run;


Data D1; input num  var1 $; datalines;
1 x1
2 x2
5 x3
;run;
Data D2; input num  var1 $; datalines;
1 y1
3 y3
4 y4
;run;

Data test;
merge d1 d2;
by  num ;
run;





Data D1; input num  var1 $; datalines ;
1 x1 
2 x2
;run;
Data D2; input num  var2 $ ; datalines;
1 x1 
1 y2
2 y3 
2 y4 
;run;

Data test;
merge d1 d2;
by num ;
run;






Data D1; input num  var1 $ n ; datalines ;
1 x1 11
2 x2 111
;run;
Data D2; input num  var1 $ m; datalines;
1 x1 2
1 y2 22
2 y3 222 
2 y4 2222
;run;

Data test;
merge d1 d2;
by num var1;
run;




Data D1; input num  var1 $; datalines;
1 x1
2 x2
4 x3
;run;
Data D2; input num  var2 $; datalines;
1 y1
1 y2
2 y3
2 y4
5 x4
;run;

Data test;
merge d1 d2;
by num;
run;






Data D1; input num  var1 $; datalines;
1 x1
1 x2
1 x3
;run;
Data D2; input num  var2 $; datalines;
1 y1
1 y2
1 y3
1 y4
2 x4
;run;

Data test;merge d1 d2;
by num;
run;






Data D1; input num  var1 $; datalines;
1 x1
2 x2
5 x3
;run;
Data D2; input num  var2 $; datalines;
1 y1
3 y3
4 y4
;run;

Data test;
merge d1(in = a) d2(in = b);
by  num;
put a= b = ;
/* put _ALL_; */
/* if a  and b ; */
run;

data t1 ; input num @@; datalines;
1 2 9
;
data t2 ;
input num @@;
datalines;
1 3 7 9 12
;
data t3 ; input num @@; datalines;
1   3 9 22 77 
;
run;

data all;
merge t1(in = a) t2 (in = b) t3 ( in = c);
by num;
if a + b + c = 1;
/* if (a= 1 and b = 0 and c = 0 ) then output; */
/* if (a= 0 and b = 1 and c = 0 ) then output; */
/* if (a= 0 and b = 0 and c = 1 ) then output ;  */
run;










Data D1; input num  var1 $; datalines;
. x1
. x2
3 x3
4 x4
;run;
Data D2; input num  var2 $; datalines;
. y1
2 y2
3 y3
4 y4
;run;

Data test;
merge d1 d2;
by num;
run;














/*Merging*/
Data D1; input num  var1 $; datalines;
1 x1
2 x2
3 x3
4 x4
;run;
Data D2; input num  var2 $; datalines;
1 y1
2 y2
3 y3
4 y4
;run;

Data test;
merge d1 d2;
run;













































