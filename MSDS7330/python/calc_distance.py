#!/usr/bin/python

import os
import hl7
from datetime import datetime
from datetime import date
from math import *

# start time
t1 = datetime.now()

# calculates the age based on birthday
def calculate_age(born):
    today = date.today()
    return today.year - born.year - ((today.month, today.day) < (born.month, born.day))

# calculates the distance given a pair of lat/long
def calcDist(lat_A, long_A, lat_B, long_B):
    distance = (sin(radians(lat_A)) *
                sin(radians(lat_B)) +
                cos(radians(lat_A)) *
                cos(radians(lat_B)) *
                cos(radians(long_A - long_B)))
    distance = (degrees(acos(distance))) * 69.09
    return distance

# read in zips file, calculate distance from 90048 zip code
zip_dict = {}
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
        #print 'Distance to %-30s %-10s ==> %10f' % (city, zip, dist)
        zip_dict[zip] = dist
    except:
        pass
        print "unable to calculate distance for",zip
f.close()
#print 'size of zip_dict:',len(zip_dict)

# For stats project also
sex_dict = {}
rac_dict = {}
error_zip = {}
rootDir = '/Users/james/data/'
errored = 0
processed = 0
for dirName, subdirList, fileList in os.walk(rootDir):
    for fname in fileList:
        if fname.startswith('A01test'):
            print dirName+"/"+fname
            fullpath = dirName+"/"+fname
            f = open(fullpath)
            for line in f:
                try:
                    h = hl7.parse(line)
                    p_zip = str(h[2][11][0][4])
                    p_rac = str(h[2][10])
                    rac_dict[p_rac] = 1
                    p_sex = str(h[2][8])
                    sex_dict[p_sex] = 1
                    p_dob = str(h[2][7])
                    if len(p_zip) > 5:
                        p_zip = p_zip[:5]
                    if len(p_rac) > 15:
                        p_rac = "Other"
                    p_age = -1
                    if len(p_dob) >= 8:
                        p_dob = p_dob[:8]
                        p_age = calculate_age(datetime.strptime(p_dob, '%Y%m%d'))
                    if len(p_zip) > 0 and p_zip in zip_dict:
                        p_dst = zip_dict[p_zip]
                        p_dst = "%.3f" % p_dst
                        print '%-10s %-10s %-10s %-10s %-10s' % (p_dst, p_zip, p_rac, p_sex, p_age)
                        processed = processed + 1
                    else:
                        if p_zip not in error_zip:
                            error_zip[p_zip] = 1
                        else:
                            error_zip[p_zip] += 1
                except:
                    errored = errored + 1
                    pass
            f.close()

print 'Total processed:',processed
print 'Total errors:',errored

print 'unique sex values:'
for (k,v) in sex_dict.items():
     print k

print 'unique rac values:'
for (k,v) in rac_dict.items():
     print k

print 'errored zip codes:'
for (k,v) in error_zip.items():
     print k,v

# print elapsed time
t2 = datetime.now()
delta = t2-t1
print "Total elapsed time:",delta.total_seconds(),"seconds."
