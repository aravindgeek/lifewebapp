#!/usr/bin/env python2
import sqlite3
conn = sqlite3.connect('life.db')
cur = conn.cursor()
cur.execute("delete from users")
cur.execute('''insert into users values("abcd","abcd",
            "abcd","abcd@gmail.com")''')
cur.execute('''insert into users values("ark","aravindhan",
            "1234","aravindlinux01@gmail.com")''')
cur.execute("select * from users")
for i in cur:
    print(i)
cur.execute("select name from users where handle=? and password=?",('abcd','abcd'))
if cur.fetchone():
    print "Yes"
conn.commit()
