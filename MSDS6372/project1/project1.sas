/* Original Data Load */
PROC IMPORT OUT=WORK.PROJECT1
	DATAFILE="C:\Users\james\Documents\My SAS Files\9.4\MSDS6372\Project1\project1_final.csv"
	DBMS=CSV REPLACE;
	GETNAMES=YES;
	DATAROW=2;
RUN;

PROC PRINT DATA=WORK.PROJECT1; RUN;

/* Figure 1 - Descriptive Statistics for Average Admit Time */
/* Figure 2 - Histogram for Average Admit Time */
PROC UNIVARIATE DATA=WORK.PROJECT1;
    VAR AVG_ADMIT_TIME;
    HISTOGRAM/NORMAL(MU=EST SIGMA=EST);
RUN;

/* Figure 3 - Time Series for Average Admit Time */
ODS GRAPHICS ON;
PROC TIMESERIES DATA=WORK.PROJECT1 PLOT=SERIES;
    ID DAY INTERVAL=DAY;
    VAR AVG_ADMIT_TIME;
RUN;

/* Figure 4 - Box Plot for Average Admit Time by Weekday */
PROC GLM DATA=WORK.PROJECT1;
    CLASS WEEKDAY;
    MODEL AVG_ADMIT_TIME=WEEKDAY;
RUN;

/* Figure 5 - Pearson Correlation Matrix */
PROC CORR DATA=WORK.PROJECT1; RUN;

/* Figure 6 - VIF Patient_Count, Avg_Age, Cat3, Cat5, Cat7 */
PROC REG DATA=WORK.PROJECT1 outest=PROJECT1RESULT plots(label) = (rstudentbyleverage cooksd);
    MODEL AVG_ADMIT_TIME=PATIENT_COUNT AVG_AGE Cat3 Cat5 Cat7 / AIC VIF  CLI; *CORRB INFLUENCE CLB;
    RUN;
QUIT;

/* Figure 7 - VIF Patient_Count, Avg_Age */
/* Figure 8 - (Histogram, QQ Plot, Scatter Plot) of Residuals */
/* Figure 9 - Studentized Residuals */
/* Figure 10 - Cook's D Distances */
/* R-Squared = 0.3915 */
PROC REG DATA=WORK.PROJECT1 outest=PROJECT1RESULT plots(label) = (rstudentbyleverage cooksd);
    MODEL AVG_ADMIT_TIME=PATIENT_COUNT AVG_AGE / AIC VIF  CLI; *CORRB INFLUENCE CLB;
    RUN;
QUIT;

ODS GRAPHICS ON;
PROC GLMSELECT DATA=WORK.PROJECT1
               SEED=1 plots(stepAxis=number)=(criterionPanel ASEPlot CRITERIONPANEL);
    MODEL AVG_ADMIT_TIME=PATIENT_COUNT AVG_AGE/ selection=LASSO(choose=AIC stop=CV) CVdetails  ;
RUN;
QUIT;
ODS GRAPHICS OFF;

/* Figure 11 - Final regression model and parameter estimates */
/* R-Squared = 0.4105 */
/* Observations 20 and 61 Removed */
PROC IMPORT OUT=WORK.PROJECT1_2
	DATAFILE="C:\Users\james\Documents\My SAS Files\9.4\MSDS6372\Project1\project1_final_adjusted.csv"
	DBMS=CSV REPLACE;
	GETNAMES=YES;
	DATAROW=2;
RUN;

PROC REG DATA=WORK.PROJECT1_2 outest=PROJECT1RESULT plots(label) = (rstudentbyleverage cooksd);
    MODEL AVG_ADMIT_TIME=PATIENT_COUNT AVG_AGE/ AIC VIF  CLI; *CORRB INFLUENCE CLB;
    RUN;
QUIT;



