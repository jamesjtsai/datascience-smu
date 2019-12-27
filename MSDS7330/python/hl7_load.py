import mysql.connector as sqlconn
import hl7
from datetime import datetime

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
                city varchar(35),\
                state varchar(3),\
                sex varchar(2),\
                race varchar(15),\
                marital varchar(15),\
                birth_pl varchar(35))")
dbc.execute("CREATE TABLE facilities ( \
                name varchar(35) not null primary key,\
                address varchar(35),\
                zipcode varchar(10),\
                city varchar(25),\
                state varchar(3))")                
dbc.execute("CREATE TABLE events( \
                event int(8) not null auto_increment primary key,\
                patient int(8), \
                admit_time date, \
                disc_time date,\
                facility varchar(20),\
                FOREIGN KEY fk_patients (patient) REFERENCES patients(patient)\
                ON DELETE CASCADE ON UPDATE CASCADE,\
                FOREIGN KEY fk_facility (facility) REFERENCES facilities(name)\
                ON DELETE CASCADE ON UPDATE CASCADE)")

dbc.execute ("CREATE VIEW tab_info \
                AS select zipcode, count(p.zipcode) count\
                FROM patients p\
                GROUP BY zipcode" )    
                
dbc.execute("commit")


f = open ('AnonymizedA01')
#f = open ('Ano1')

for line in f:
    try:
        h = hl7.parse(line)
      # patients    
        p_zip =     str(h[2][11][0][4])
        p_city =    str(h[2][11][0][2])
        p_state =   str(h[2][11][0][3])
        p_sex =     str(h[2][8]) 
        p_death =   str(h[2][30])
        p_race =    str(h[2][10])
        p_marital = str(h[2][16])
        p_birth_pl= str(h[2][23][0][2])       
        dob =       str(h[2][7])
        p_dob = datetime.strptime(dob[0:8], '%Y%m%d')

      # events
        admit = str(h[1][2])
        p_admit = datetime.strptime(admit[0:8], '%Y%m%d')
        dischg = str(h[1][4])  
    #    e_dischg = datetime.strptime(dischg[0:8], '%Y%m%d')
    #    e_fname = str(h[1][5][0][8])

    
      # facilities
    #    f_name = str(h[3][3][0][0])       
    #    f_addr = str(h[4][11])
    #    f_city = str(h[4][11][0][2])
    #    f_zip = str(h[4][11][0][4])
        f_name = "CSMC"
        f_addr = "8700 Beverly Blvd."
        f_city = "Los Angeles"
        f_zip  = "90048"
  
    except IndexError:
        pass

    dbc.execute ("INSERT INTO patients (zipcode,city,state,sex,race,marital,birth_pl)\
                  VALUES (%s,%s,%s,%s,%s,%s,%s)",[p_zip,p_city,p_state,p_sex,p_race,\
                  p_marital,p_birth_pl])    
    dbc.execute ("INSERT INTO events (admit_time)\
                  VALUES (%s)",[p_admit])   


dbc.execute ("INSERT INTO facilities (name, address, city, zipcode)\
              VALUES (%s,%s,%s,%s)", [f_name,f_addr,f_city,f_zip])                 
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
