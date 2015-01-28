#!/usr/bin/env python2
from bottle import route, run, template, static_file, request
import sqlite3
import smtplib
from email.mime.text import MIMEText
import hashlib
from random import randint
import sys
def send_cryptmsg(userhandle, msg_type):
    smtpserver = smtplib.SMTP('localhost', 1025)
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    randomSequence = ''
    for i  in range(16):
        randomSequence = randomSequence + str(randint(0,9))

    if msg_type == 0: #email_verification
        cur.execute('select email from tempusers where handle=?',(userhandle,))
        email_id = cur.fetchone()[0]
        hashmsg = userhandle + email_id + randomSequence
        cryptcode = hashlib.sha256(hashmsg).hexdigest()
        content = '''  You were received this mail because you are trying to register in our lifewebapp. By clicking the link below
        <a> http://localhost:8080/confirmmail?userid={0}&cryptcode={1}</a>.
        This is an auto created email.So de not replay'''.format(userhandle, cryptcode)
        msg = MIMEText(content)
        msg['Subject'] = 'Email verification - Lifewebapp'
        msg['From'] = 'Life Web App Admin'
        msg['To'] = email_id

        cur.execute('insert into mail_auth_codes values(?, ?, ?)',(userhandle,
        cryptcode, msg_type));
        conn.commit()
        smtpserver.sendmail('LifeWebAppAdmin', [email_id], msg.as_string())

    elif msg_type == 1: # password_reset
        cur.execute('select email from users where handle=?',(userhandle,))
        email_id = cur.fetchone()[0]
        hashmsg = userhandle + email_id + randomSequence
        cryptcode = hashlib.sha256(hashmsg).hexdigest()
        content = '''  You were received this mail because you were asked to
        reset your password. By clicking the link below
        <a> http://localhost:8080/changepwd?userid={0}&cryptcode={1}</a>.
        This is an auto created email.So de not replay'''.format(userhandle, cryptcode)
        msg = MIMEText(content)
        msg['Subject'] = 'Password reset- Lifewebapp'
        msg['From'] = 'Life Web App Admin'
        msg['To'] = email_id

        cur.execute('insert into mail_auth_codes values(?, ?, ?)',(userhandle,
        cryptcode, msg_type));
        conn.commit()
        smtpserver.sendmail('LifeWebAppAdmin', [email_id], msg.as_string())

    else:
        pass

    conn.close()
    smtpserver.quit()

@route('/')
@route('/home')
def home_page():
    return template('home',name="Aravindhan")

@route('/login')
def login_page():
    return template('login',msg="")

@route('/login', method='POST')
def login_authentication():
    errMsg = '<p color="red">entered username or password is incorrect.</p>'
    username = request.forms.get('username')
    password = request.forms.get('password')
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    cur.execute('select name from users where handle=? and password=?',(username,password))
    try:
        name = cur.fetchone()[0]
        return template('<b> Welcome {{UserName}} to our site</b>', UserName=name)
    except:
        pass
    conn.close()
    return template('login',msg=errMsg)

@route('/newuser')
def newuser():
    return template('new_user')

@route('/newuser',method='POST')
def addentrytodb():
    name = request.forms.get('name')
    handle = request.forms.get('userid')
    email = request.forms.get('email')
    password = request.forms.get('passwd')
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
#checking on user tables preregistered user
    cur.execute('select * from users where handle=? OR email=?',(handle, email))
    if cur.fetchone():
        return template(
            'the userhandle {{uhandle}} and email {{eid}} already exists',
            uhandle = handle, eid = email)
#checking ont temp_users table for non-confirmed user
    cur.execute('select * from tempusers where handle=? OR email=?',(handle, email))
    if cur.fetchone():
        return template('''You have already tried to register confirm email accout. To resend the mail click here.<a> localhost/resendmail?={{eid}}</a>''',eid=email)

#inserting users data to tempusers
    cur.execute('insert into tempusers values(?, ?, ?, ?)',
            (handle, name, password, email))
    conn.commit()
    conn.close()
    send_cryptmsg(handle, 0)
    return '<b> A mail has been sent to your mail id to confirm registratinon </b>'

@route('/resetpwd')
def passwdresetpage():
    return template('reset_password')

@route('/resetpwd', method='POST')
def sendresetlink():
    email_id = request.forms.get('email_id')
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    cur.execute('select handle from users where email=?',(email_id,))
    try:
        userhandle = cur.fetchone()[0]
        send_cryptmsg(userhandle, 1)
    except:
        raise
        return '<b> The entered email addres not found</b>'
    return '<b> A reset link has been sent to your email</b>'

@route('/changepwd')
def newpasswordform():
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    #checking the crypt codes
    userhandle = request.query.userid
    cryptcode = request.query.cryptcode
    cur.execute('select * from mail_auth_codes where handle =? and cryptcode=? and type=1' ,(userhandle, cryptcode))
    if cur.fetchone():
        return template('new_password',handle=userhandle, cc=cryptcode)
        conn.commit()
        conn.close()
    else:
        return '<b> An invalid request has been received</b>'
        conn.commit()
        conn.close()

@route('/changepwd', method='POST')
def changepassword():
    userhandle = request.forms.get('userhandle')
    cryptcode = request.forms.get('cryptcode')
    password = request.forms.get('new_pwd')
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    cur.execute('update users set password=? where handle=?',(password,
    userhandle))
    cur.execute('delete from mail_auth_codes where handle =? and cryptcode=? and type=1', (userhandle, cryptcode))
    conn.commit()
    conn.close()
    return '<b> Your password has succesfully updated</b>'

@route('/confirmmail')
def confirmemailaddress():
    cryptcode = request.query.cryptcode
    userhandle = request.query.userid
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    cur.execute('select * from mail_auth_codes where handle =? and cryptcode=? and type=0' ,(userhandle, cryptcode))
    if cur.fetchone():
        cur.execute('select * from tempusers where handle=?', (userhandle,))
        cur.execute('insert into users values(?, ?, ?, ?)', cur.fetchone())
        cur.execute('delete from tempusers where handle=?', (userhandle,))
        cur.execute('delete from mail_auth_codes where handle =? and cryptcode=? and type=0' ,(userhandle, cryptcode))
        conn.commit()
        conn.close()
        return '<b> Your email id has successfully authenticated</b>'
    else:
        return '<b> An illegal request has been received </b>'

@route('/about')
def aboutpage():
    return template('about')

@route('/demo')
def demo_page():
    return template('demo')

@route('/images/<name>')
def image(name):
    return static_file(name, root='./images/')

@route('/css/<name>')
def css(name):
    return static_file(name, root='./css/')

@route('/js/<name>')
def js(name):
    return static_file(name, root='./js/')

run(host='localhost', port =8080, debug=True, reloader=True)


