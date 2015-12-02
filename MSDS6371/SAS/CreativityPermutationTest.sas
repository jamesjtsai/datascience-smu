data creativity;
input Score Treatment;
datalines;
12  1                                            
12  1                                            
12.9  1                                          
13.6  1                                          
16.6  1                                          
17.2  1                                          
17.5  1                                          
18.2  1                                          
19.1  1                                          
19.3  1                                          
19.8  1                                          
20.3  1                                          
20.5  1                                          
20.6  1                                          
21.3  1                                          
21.6  1                                          
22.1  1                                          
22.2  1                                          
22.6  1                                          
23.1  1                                          
24  1                                            
24.3  1                                          
26.7  1                                          
29.7  1                                          
5  2                                             
5.4  2                                           
6.1  2                                           
10.9  2                                          
11.8  2                                          
12  2                                            
12.3  2                                          
14.8  2                                          
15  2                                            
16.8  2                                          
17.2  2                                          
17.2  2                                          
17.4  2                                          
17.5  2                                          
18.5  2                                          
18.7  2                                          
18.7  2                                          
19.2  2                                          
19.5  2                                          
20.7  2                                          
21.2  2                                          
22.1  2                                          
24  2                                            
;                                            
                                             
* To get the observed difference;                                        
proc ttest data=creativity;  * You will need to change the dataset name here.; 
    class treatment;    *and change the class variable to match yours here;                               
    var score;  * and change the var name here.;                                  
run;                                             
                                             
*borrowed code from internet ... randomizes observations and creates a matrix ... one row per randomization ;                        
proc iml;                                            
    use Creativity;        * change data set name here;                                  
    read all var{treatment score} into x;   *change varibale names here;                                 
    p = t(ranperm(x[,2],3000));                                          
    paf = x[,1]||p;                                          
    create newds from paf;                                           
    append from paf;                                         
quit;                                            
                                             
*calculates differences and creates a histogram;                                     
ods output conflimits=diff;                                          
proc ttest data=newds plots=none;                                        
    class col1;                                            
    var col2 - col3001;                                        
run;

proc univariate data=diff;                                       
    where method = "Pooled";                                       
    var mean;                                          
    histogram mean;                                            
run;                                             
                                             
*calculates the number of randomly generated differences that are as extreme or more extreme thant the one observed (divide this number by 1000 you have the pvalue);            
*check the log to see how many observations are in the data set.... divide this by 1000 and that is the (one sided)p-value;                      
data numdiffs;
    set diff;
    where method = "Pooled";                                         
    if abs(mean) >= 4.14;   *you will need to put the observed difference you got from t test above here.;                           
run;

* just a visual of the rows produced ... you can get the number of obersvations from the last data step and the Log window.;                     
proc print data = numdiffs;
    where method = "Pooled";
run;

proc print data = diff;
run;                                             
