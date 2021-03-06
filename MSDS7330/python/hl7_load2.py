# MSDS7730
import mysql.connector as sqlconn
import hl7
import random
from datetime import datetime
from datetime import date
from math import *

# start time
t1 = datetime.now()

db = sqlconn.connect(host="sigma",user="james", passwd="princess")
dbc = db.cursor()
dbc.execute("CREATE DATABASE IF NOT EXISTS hl7db")
dbc.execute("USE hl7db") 
dbc.execute("DROP TABLE IF EXISTS events")
dbc.execute("DROP TABLE IF EXISTS patients")
dbc.execute("DROP TABLE IF EXISTS facilities")
dbc.execute("DROP VIEW IF EXISTS tab_info")
dbc.execute("CREATE TABLE patients ( \
                patient int(8) not null auto_increment primary key, \
                zipcode varchar(10), \
                city varchar(25),\
                state varchar(20),\
                sex varchar(2),\
                race varchar(15),\
                marital varchar(20),\
                age int(5))")
dbc.execute("commit")

def genRandNumber(z):
    return random.randint(1,z)
    
def calculate_age(born):
    today = date.today()
    return today.year - born.year - ((today.month, today.day) < (born.month, born.day))
    
def calcDist(lat_A, long_A, lat_B, long_B):
    distance = (sin(radians(lat_A)) *
                sin(radians(lat_B)) +
                cos(radians(lat_A)) *
                cos(radians(lat_B)) *
                cos(radians(long_A - long_B)))
    distance = (degrees(acos(distance))) * 69.09
    return distance
    
#print calcDist(34.073759, -118.37376, 34.122658, -118.11296)

inserts = 0
count = 0
freq = genRandNumber(100)
f = open ('ersh1700_20151117.dat.A04')
for line in f:
    count = count+1
    try:
        if (count%100 == freq):
            h = hl7.parse(line)
            #patient demographics
            p_zip = str(h[2][11][0][4])
            p_city =  str(h[2][11][0][2])
            p_state = str(h[2][11][0][3])
            p_sex =   str(h[2][8])
            p_death = str(h[2][30])
            p_race =  str(h[2][10])
            p_marital = str(h[2][16])
            p_birth_pl =   str(h[2][23])
            dob = str(h[2][7])
            if len(p_state) > 20:
                p_state = p_state[:20]
            if len(p_race) > 15:
                p_race = "Other"
            if len(p_marital) == 0:
                p_marital = 'U'
            else:
                p_marital = p_marital[0]
            p_age = -1
            if len(dob) >= 8:
                dob = dob[:8]
            p_age = calculate_age(datetime.strptime(dob, '%Y%m%d'))
            dbc.execute ("INSERT INTO patients (zipcode,city,state,sex,race,marital,age)\
            VALUES (%s,%s,%s,%s,%s,%s,%s)",[p_zip,p_city,p_state,p_sex,p_race,p_marital,p_age])
            inserts += 1
            print "Inserted",inserts,"rows."
    except:
        print "could not parse message"
        pass
f.close()
dbc.execute("commit")

# print elapsed time
t2 = datetime.now()
delta = t2-t1
print "Total elapsed time:",delta.total_seconds(),"seconds."
