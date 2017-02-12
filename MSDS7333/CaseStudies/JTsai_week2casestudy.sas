
/* Import data */
proc import datafile='D:\Dropbox\SMU\Quant\Projects\Unit2\carmpg_2_2.txt' out=cars_data dbms=tab replace;
   getnames=yes;
run;

proc print data = cars_data;
run;

/* Run PROC REG to create initial model */
title 'Predicting MPG';
proc reg data = cars_data;
model mpg = cylinders size hp weight;
run;

/* Generate missing data pattern */
proc MI data = cars_data  nimpute = 0;
var  mpg cylinders size hp weight accel eng_type;
run;

/* Run multiple imputation process with default number imputations of 25 */ 
PROC MI data = cars_data  out = miout seed = 10001;
var mpg cylinders size hp weight accel eng_type;
run; 

proc print data = miout ;
run;

/* Recreate regression model using complete data set from multiple imputation result */
proc reg data = miout outest = outreg covout;
model mpg = cylinders size hp weight;
by _Imputation_;
run;

proc print data = outreg ;
run;

/* Combine parameter estimate for inferences that are obtainfrom each analyzed data set */
proc mianalyze data = outreg;
modeleffects  Intercept cylinders size hp weight ;
run;
