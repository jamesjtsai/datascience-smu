#!/usr/bin/python

from datetime import datetime
from datetime import date
from math import *

# start time
t1 = datetime.now()

def calcDist(lat_A, long_A, lat_B, long_B):
    distance = (sin(radians(lat_A)) *
                sin(radians(lat_B)) +
                cos(radians(lat_A)) *
                cos(radians(lat_B)) *
                cos(radians(long_A - long_B)))
    distance = (degrees(acos(distance))) * 69.09
    return distance

f = open ('zips.csv')
for line in f:
    try:
        line = line.replace('"', '')
        values = line.split(",")
        zip = values[0].strip()
        state = values[1].strip()
        lat = values[2].strip()
        long = values[3].strip()
        city = values[4].strip()
        state = values[5].strip()
        dist = calcDist(34.073759, -118.37376, float(lat), float(long))
        print 'Distance to %-30s %-10s ==> %10f' % (city, zip, dist)
    except:
        pass
        print "unable to calculate distance for",zip
f.close()

# print elapsed time
t2 = datetime.now()
delta = t2-t1
print "Total elapsed time:",delta.total_seconds(),"seconds."
