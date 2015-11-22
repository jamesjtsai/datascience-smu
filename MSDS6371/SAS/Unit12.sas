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