#!/usr/bin/env python2
import sqlite3
import json
conn = sqlite3.connect('life.db')
cur = conn.cursor()
cur.execute("delete from users")
cur.execute('''insert into users values("abcd","abcd",
            "abcd","abcd@gmail.com")''')
cur.execute('''insert into users values("ark","aravindhan",
            "1234","aravindlinux01@gmail.com")''')
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,2],[2,1],[2,3],[3,2],[2,4],[2,5]]}', "MyFirst","0","0")''');            
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,1],[1,2],[2,1],[2,2]]}', "StillLife- Block","0","0")''');            
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,2], [1,3], [2,1], [2,4], [3,2], [3,3]]}', "StillLife-Beehive","0","0")''');
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,2], [1,3], [2,1], [2,4], [3,2], [3,4],[4,3]]}', "StillLife-Loaf","0","0")''');                        
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,1], [1,2], [2,1], [2,3], [3,2]] }', "StillLife-Boat","0","0")''');                      

cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,1], [1,2], [1,3]]}', "Blinker","0","0")''');
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,2], [1,3], [1,4], [2,1], [2,2], [2,3]]}', "Toad oscillator","0","0")''');
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,1], [1,2], [2,1], [2,2], [3,3], [3,4], [4,3], [4,4]]}', "Beacon oscillator","0","0")''');
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,2], [2,3], [3,1], [3,2], [3,3]]}', "Simple Glider","0","0")''');
cur.execute('''insert into lifes values("AravindhanK",'{"points":[[1,2], [1,3], [1,4], [1,5], [2,5], [3,5], [2,1], [4,1], [4,4]]}', "Lightweight Spaceship","0","0")''');


cur.execute("select * from users")
for i in cur:
    print(i)
cur.execute("select name from users where handle=? and password=?",('abcd','abcd'))
if cur.fetchone():
    print "Yes"
conn.commit()
