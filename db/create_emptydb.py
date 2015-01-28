#!/usr/bin/env python2
import sqlite3
conn = sqlite3.connect("life.db")
cur = conn.cursor()
cur.execute(" drop table lifes")
cur.execute('''CREATE TABLE lifes (
    "author" TEXT NOT NULL,
    "world" BLOB, "thumb" TEXT,
    "id" TEXT NOT NULL,
    "likes_count" INTEGER)''')

cur.execute("drop table users")
cur.execute('''CREATE TABLE "users" (
    "handle" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL )''')

cur.execute("drop table tempusers")
cur.execute('''CREATE TABLE "tempusers" (
    "handle" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL )''')

cur.execute("drop table mail_auth_codes")
cur.execute('''CREATE TABLE "mail_auth_codes" (
    "handle" TEXT NOT NULL,
    "cryptcode" TEXT NOT NULL,
    "type" INTEGER NOT NULL)''')
conn.commit()
cur.close()
