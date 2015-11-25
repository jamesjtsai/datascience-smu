data crab;
input Force	Height	Species $25.;
datalines;
3.2	5	Hemigrapsus_nudus
6.4	6	Hemigrapsus_nudus
2	6.4	Hemigrapsus_nudus
2	6.5	Hemigrapsus_nudus
4.9	6.6	Hemigrapsus_nudus
3	7	Hemigrapsus_nudus
2.9	7.9	Hemigrapsus_nudus
9.5	7.9	Hemigrapsus_nudus
4	8	Hemigrapsus_nudus
3.4	8.2	Hemigrapsus_nudus
7.4	8.3	Hemigrapsus_nudus
2.4	8.8	Hemigrapsus_nudus
4	12.1	Hemigrapsus_nudus
5.2	12.2	Hemigrapsus_nudus
2.1	5.1	Lophopanopeus_bellus
8.7	5.9	Lophopanopeus_bellus
2.9	6.6	Lophopanopeus_bellus
6.9	7.2	Lophopanopeus_bellus
8.7	8.6	Lophopanopeus_bellus
15.1	7.9	Lophopanopeus_bellus
14.6	8.1	Lophopanopeus_bellus
17.6	9.6	Lophopanopeus_bellus
20.6	10.2	Lophopanopeus_bellus
19.6	10.5	Lophopanopeus_bellus
27.4	8.2	Lophopanopeus_bellus
29.4	11	Lophopanopeus_bellus
5	6.7	Cancer_productus
7.8	7.1	Cancer_productus
14.6	11.2	Cancer_productus
16.8	11.4	Cancer_productus
17.7	9.4	Cancer_productus
19.8	10.7	Cancer_productus
19.6	13.1	Cancer_productus
22.5	9.4	Cancer_productus
23.6	11.6	Cancer_productus
24.4	10.2	Cancer_productus
26	12.5	Cancer_productus
29.4	11.8	Cancer_productus
;
proc print data = crab;
run;

proc sgscatter data = crab;
matrix  Force	Height/group=	Species;
run;

proc sgplot data = crab;
scatter x = force y = height / group=species;
run;

data lcrab;
set crab;
lforce = log(force);
lheight = log(height);
run;

proc sgscatter data = lcrab;
plot lheight*lforce/group=species;
run;

proc sgplot data = lcrab;
scatter x = lheight y = lforce / group=species;
run;

symbol1 value=x color=gold;
symbol2 value=star color=black;
symbol3 value=square color=green;
proc goptions symbol nolist;
run;
proc gplot data = lcrab;
plot lheight*lforce=species;
run;

proc glm data = lcrab;
class species (ref="Hemigrapsus_nudus");
model lforce=lheight | species/solution;
run;

data lcrab1;
set lcrab;
if species="Cancer_productus" then dmy1=1;else dmy1=0;
if species="Lophopanopeus_bellus" then dmy2=1;else dmy2=0;
intac1 = dmy1*lheight;
intac2 = dmy2*lheight;
run;
proc print data = lcrab1;
run;

proc reg data = lcrab1;
model lforce=lheight  dmy1 dmy2 intac1 intac2;
run;

/* question 2 */
data braindata;
input Brain Body Gestation Litter; 
datalines;
Brain Body Gestation Litter
9.6 2.2 31 5
9.9 0.78 98 1.2
4480 2800 655 1
20.3 2.8 104 1.3
219 89 218 1
53 6 60 2.2
210 66 158 1.2
124 16 183 1.1
28.5 3.2 65 4
500 250 240 1.8
45 25 128 4
200 39 180 1
9.9 0.7 135 1
40 20 128 2.9
76 30 123 3
288 110 225 1
456 520 280 1
360 45 230 1
5.25 0.43 110 2
0.68 0.027 23 3.7
0.63 0.026 23 5
0.52 0.017 24 5
0.69 0.024 24 5
70.2 8.5 63 4
1600 160 360 1
28.4 2.5 63 4
106 30 151 2
180 190 115 8
125 49 150 2.4
93 13 120 1
480 560 255 1
1.14 0.049 51 1.5
1.37 0.064 46 1.5
365 120 235 1
223 80 240 1
1.89 0.052 40 3.1
355 250 254 1
7.8 0.22 145 2
406 140 265 1
37.3 3.8 63 3.7
400 250 219 2.3
4.28 0.97 67 2.6
183 21 180 1
0.67 0.036 21 4.6
1.12 0.13 16 6.3
442 110 240 1
3.5 0.93 34 4.6
590 1400 240 1
1.18 0.15 27 5.6
712 480 330 1
0.45 0.024 19 5
54 7.7 139 1
1300 65 270 1
20.5 3.8 225 2.4
13.3 2.9 41 2.5
31.2 2 77 1.1
65.5 5.8 168 1
22 2.1 135 1
157 46 92 2.5
260 180 108 3
225 93 330 1
12 3.7 120 4
75 12 60 2.5
23 5 132 5.5
343 37 270 1
37 11 112 1.2
37 14 112 1.2
24 6.6 113 1
537 56 270 1
1.04 0.065 21 4
260 150 205 1
17.5 3.5 26 1
41.6 5.3 63 3.5
0.72 0.05 23 7.3
2.38 0.34 21 8
435 200 255 1
48 6 52 4
84.6 6 175 1
107 8.7 165 1.1
73 3.7 180 1
383 120 246 1.1
363 100 343 1
12.8 1.2 90 1.2
114 9.1 140 1
109 7.7 140 1
250 230 390 1
302 210 104 3
3.15 0.15 46 3
6.23 0.33 38 3
67 4.6 195 1
198 45 300 1.1
550 400 310 1
179 32 180 1
102 5.5 210 1
185 150 120 4
334 250 255 1
;

proc sgscatter data = braindata;
matrix Brain Body Gestation Litter; 
run;

data lbraindata;
set braindata;
lbrain = log(brain);
lbody = log(body);
lgestation = log(gestation);
llitter = log(litter);
;

proc sgscatter data = lbraindata;
matrix lbrain lbody lgestation llitter; 
run;

proc glm data = lbraindata;
model lbrain=lbody lgestation llitter;
run;

proc reg data = lbraindata;
model lbrain=lbody lgestation llitter;
run;