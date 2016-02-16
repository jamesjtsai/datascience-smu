#!/usr/bin/python

sum1=0.0
sum2=0.0
count=0.0
prev_f1=0
prev_f2=0
prev_f4='Thursday'
grp0=grp1=grp2=grp3=grp4=grp5=grp6=grp7=grp8=grp9=0

f = open('input2.csv', 'r')
for line in f:

   t = line.split(',')
   f0 = t[0].strip()
   f1 = float(t[1].strip())
   f2 = int(t[2].strip())
   f3 = float(t[3].strip())
   f4 = t[4].strip()

   if prev_f4 == f4:
      sum1=sum1+f1
      sum2=sum2+f3
      count+=1.0
   else:
      print str(sum1/count)+','+str(sum2/count)+','+str(int(count))+','+str(prev_f2)+','+str(prev_f4)+','+str(grp0)+','+str(grp1)+','+str(grp2)+','+str(grp3)+','+str(grp4)+','+str(grp5)+','+str(grp6)+','+str(grp7)+','+str(grp8)+','+str(grp9)
      count=1.0
      sum1=f1
      sum2=f3
      grp0=grp1=grp2=grp3=grp4=grp5=grp6=grp7=grp8=grp9=0
   if f0.startswith('I00') or f0.startswith('I01') or f0.startswith('I02'):
         grp0+=1
   if f0.startswith('I05') or f0.startswith('I06') or f0.startswith('I07') or f0.startswith('I08') or f0.startswith('I09'):
         grp1+=1
   if f0.startswith('I1'):
         grp2+=1
   if f0.startswith('I20') or f0.startswith('I21') or f0.startswith('I22') or f0.startswith('I23') or f0.startswith('I24') or f0.startswith('I25'):
         grp3+=1
   if f0.startswith('I26') or f0.startswith('I27') or f0.startswith('I28'):
         grp4+=1
   if f0.startswith('I3') or f0.startswith('I4') or f0.startswith('I5'):
         grp5+=1
   if f0.startswith('I6'):
         grp6+=1
   if f0.startswith('I7'):
         grp7+=1
   if f0.startswith('I8'):
         grp8+=1
   if f0.startswith('I9'):
         grp9+=1
   prev_f2=f2
   prev_f4=f4

print str(sum1/count)+','+str(sum2/count)+','+str(int(count))+','+str(prev_f2)+','+str(prev_f4)+','+str(grp0)+','+str(grp1)+','+str(grp2)+','+str(grp3)+','+str(grp4)+','+str(grp5)+','+str(grp6)+','+str(grp7)+','+str(grp8)+','+str(grp9)
f.close()
