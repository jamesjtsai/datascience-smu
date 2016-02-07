# -*- coding: utf-8 -*-
"""
Created on Sat Feb 06 16:34:56 2016

@author: james
"""

import glob
import hl7
from datetime import datetime
from datetime import date


def calculate_age(born):
    today = date.today()
    return today.year - born.year - ((today.month, today.day) < (born.month, born.day))
    
# Response: admit time
# Explanatory: age, gender, weight, height, race, ICD-10 code
now = datetime.now()
count = 0
output = open('E:/cygwin64/home/james/stats/output.csv','w')
for fname in glob.glob('E:/cygwin64/home/james/stats/*.dat'):
    f = open (fname)
    for line in f:
        count = count+1
        try:
            h = hl7.parse(line)
            #msh10 = str(h[0][10])
            admit = str(h[1][2])
            a1 = admit[4:6]+"-"+admit[6:8]+"-"+admit[0:4]
            a2 = admit[8:10]+":"+admit[10:12]+":"+admit[12:14]
            gender =   str(h[2][8])
            race =  str(h[2][10])
            dob = str(h[2][7])
            age = str(calculate_age(datetime.strptime(dob[0:8], '%Y%m%d')))
            height = 'NA'
            weight = 'NA'
            icd10 = 'NA'
            obx_cnt = 1
            for index in range(len(h)):
                if str(h[index][0])  == 'OBX':
                    if (obx_cnt==1):
                        height = str(h.segments('OBX')[0][5])
                    if (obx_cnt==2):
                        weight = str(h.segments('OBX')[1][5])
                    obx_cnt+=1
                if str(h[index][0]) == 'DG1':
                    icd10 = str(h.segments('DG1')[0][3])
            data = icd10+"|"+a1+"|"+a2+"|"+age+"|"+gender+"|"+height+"|"+weight+"|"+race
            output.write(data)
            output.write('\n')
            output.flush()
        except:
            print "could not parse message"
            pass
    f.close()
    output.close()