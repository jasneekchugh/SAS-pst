data test;
set sashelp.class;
output;
run;

data test;
x=1;
output;
y=1;
output;
run;


data t1 t2 t3;
set sashelp.class;
if sex='M' then output t1;
else output t2;
output;
run;
