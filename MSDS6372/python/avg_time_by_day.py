#!/usr/bin/python

day=0
temp=0.0
count=0.0
prev_a0=0
prev_d0='Thursday'

f = open('Dump.csv', 'r')
for line in f:
   t = line.partition(',')
   a0 = float(t[0].strip())
   d0 = t[2].strip()
   if prev_d0 == d0:
      temp=temp+a0 
      count+=1.0
   else:
      day+=1
      print str(int(count))+','+str(day)+','+str(temp/count)+','+str(int(count))
      count=1.0
      temp=a0
      prev_d0=d0

day+=1
print str(int(count))+','+str(day)+','+str(temp/count)+','+str(int(count))
