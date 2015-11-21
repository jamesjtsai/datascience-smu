# MSDS7730
import mysql.connector as sqlconn
import hl7
from datetime import datetime
"""
db = sqlconn.connect(host="haswell9",user="wid", passwd="oracle01")
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
                state varchar(3),\
                sex varchar(2).\
                race varchar(15),\
                marital varchar(10),\
                birth_pl varchar(20),\)")
dbc.execute("CREATE TABLE events( \
                patient int(8), \
                admit_time date, \
                disc_time date,\
                facility varchar(20),\
                FOREIGN KEY(patient) REFERENCES patients(patient)\
                ON DELETE CASCADE,\
                FOREIGN KEY(facility)REFERENCES facilities(name)\
                ON DELETER CASCADE)")
dbc.execute("CREATE TABLE facilities ( \
                name varchar(20) primary key,\
                address varchar(20),\
                zipcode varchar(10),\
                city varchar(15),\
                state varchar(3))")
dbc.execute ("CREATE VIEW tab_info \
                AS select zipcode, count(p.zipcode) count\
                FROM patients p\
                GROUP BY zipcode" )    
                
dbc.execute("commit")


for line in f:
    h = hl7.parse(line)
    print h
    bdate = h[1][0]
    print bdate

""" 
f = open ('AnonymizedA01')
for line in f:
    h = hl7.parse(line)
  # patients    
    p_zip =   str(h[2][11][0][4])
    p_city =  str(h[2][11][0][2])
    p_state = str(h[2][11][0][3])
    p_sex =   str(h[2][8]) 
    p_death = str(h[2][30])
    p_race =  str(h[2][10])
    p_marital = str(h[2][16])
    p_birth_pl =   str(h[2][23])
    dob = str(h[2][7])
    p_dob = datetime.strptime(dob[0:8], '%Y%m%d')
     
  # events
    admit = str(h[1][2])
    p_admit = datetime.strptime(admit[0:8], '%Y%m%d')
    dischg = str(h[1][4])    
    e_dischg = datetime.strptime(dischg[0:8], '%Y%m%d')

  # facilities
    f_name = str(h[0][4])
#    print f_name
    f_zip = "90210"

    dbc.execute ("INSERT INTO patients (zipcode,city,state,sex,ethnic,marital,birth_pl)\
                  VALUES (%s,%s,%s,%s,%s,%s,%s)",[p_zip,p_city,p_state,p_sex,p_race,\
                  p_marital,p_birth_pl])    
    dbc.execute ("INSERT INTO facilities (name, address, zipcode, city)\
                  VALUES (%s,%s,%s,%s), f_name, )
    dbc.execute ("INSERT INTO events (admit_time, fac)\
                  VALUES (%s,%s)",[admit_dt, f_zip])   
                  

dbc.execute("commit")    
    
f.close()



"""

    msgs = line.split('\r')
    msh = msgs[0]
    evn = msgs[1]
    pid = msgs[2]
    nk1 = msgs[3]
    pv1 = msgs[4]
    in1 = msgs[5]
    print msh
    parse_message(msgs)
   # message = parse_message(msh)
f.close()


message = 'MSH|^~\&|GHH LAB|ELAB-3|GHH OE|BLDG4|200202150930||ORU^R01|CNTRL-3456|P|2.4\r'
message += 'PID|||555-44-4444||EVERYWOMAN^EVE^E^^^^L|JONES|196203520|F|||153 FERNWOOD DR.^^STATESVILLE^OH^35292||(206)3345232|(206)752-121||||AC555444444||67-A4335^OH^20030520\r'
message += 'OBR|1|845439^GHH OE|1045813^GHH LAB|1554-5^GLUCOSE|||200202150730||||||||555-55-5555^PRIMARY^PATRICIA P^^^^MD^^LEVEL SEVEN HEALTHCARE, INC.|||||||||F||||||444-44-4444^HIPPOCRATES^HOWARD H^^^^MD\r'
message += 'OBX|1|SN|1554-5^GLUCOSE^POST 12H CFST:MCNC:PT:SER/PLAS:QN||^182|mg/dl|70_105|H|||F'

h = hl7.parse(message)
print h[0][4]
"""
