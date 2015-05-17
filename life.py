#!/usr/bin/env python2
from bottle import route, run, template, static_file, request, response
from bottle import redirect
import sqlite3
import smtplib
from email.mime.text import MIMEText
import hashlib
from random import randint
import sys
import pdb
import bottle_session
import bottle

def send_cryptmsg(userhandle, msg_type):
    """ This send_cryptmsg functions sends user email verification during the 
    new user registration and sends a link to their when password reset is
    required."""
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
        print("Invalid msg_type is given in send_cryptmsg() function")

    conn.close()
    smtpserver.quit()

@route('/')
@route('/home')
def home_page():
    return template('home',name="Aravindhan")

@route('/login')
def login_page():
    #pdb.set_trace()
    user_name = request.get_cookie("username", secret='MySecret')
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    if user_name is not None and user_name is not '':
        cur.execute('select name from users where handle=?',(user_name, ))
        print(cur.fetchone())
        redirect('/app')
    else:
        return template('login',msg="")

@route('/logout')
def logout_page():
    user_name = response.set_cookie("username",'',secret='MySecret')
    redirect('/home')

@route('/login', method='POST')
def login_authentication():
    errMsg = '<p color="red">entered username or password is incorrect.</p>'
    username = request.forms.get('username')
    password = request.forms.get('password')
    #print(username)
    #print(password)
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    cur.execute('select name from users where handle=? and password=?',(username,password))
    #pdb.set_trace()
    try:
        name = cur.fetchone()[0]
        print("There exists the username and password")
    except Exception as e:
        return template('login',msg=errMsg)
        pass
    user_name = response.set_cookie("username", username, secret='MySecret')
    redirect('/app')
    conn.close()


@route('/newuser')
def newuser():
    return template('new_user')

@route('/newuser',method='POST')
def addentrytodb():
    pdb.set_trace()
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
    return '<b> A mail has been sent to your mail id to confirm registration </b>'

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

@route('/demo-lifes')
def demo_lifes_page():
    req_item = request.query.req_item
    if req_item == 'list':
        return template('demo_life_menu.tpl')
    else:
        jsonLife = ""
        conn = sqlite3.connect('./db/life.db')
        cur = conn.cursor()
        cur.execute('select world from lifes where id = ? and type=0',(req_item,))
        jsonLife = (cur.fetchone()[0]).encode('ascii', 'ignore')
        conn.commit()
        conn.close()
        return jsonLife

@route('/getlifes')
def getlifes():
    try:
        #pdb.set_trace()
        user_name = request.get_cookie("username", secret='MySecret')
        print(user_name)
        req_item = request.query.req_item
        is_list = request.query.is_list
        if is_list == 'true':
            template_string = ''
            conn = sqlite3.connect('./db/life.db')
            cur = conn.cursor()
            cur.execute('select id from lifes where author=?',(user_name,))
            print('This comes here and user_name =' + user_name)
            for life in cur:
                l = life[0].encode('ascii', 'ignore')
                template_string = template_string + '<li class="pure-menu-item"><a class="pure-menu-link open-life-link">' + l + '</a></li>'
                template_string = template_string + '\n'
            return template(template_string)
        else:
            jsonLife = ""
            conn = sqlite3.connect('./db/life.db')
            cur = conn.cursor()
            cur.execute('select world from lifes where id = ? and author =?',(req_item,user_name))
            jsonLife = (cur.fetchone()[0]).encode('ascii', 'ignore')
            conn.commit()
            conn.close()
            return jsonLife
    except Exception as e:  
        print(str(e))

@route('/getgallerylifes')        
def getgallerylifes():
    user_name = request.get_cookie("username", secret='MySecret')
    if user_name != None:
        req_item = request.query.req_item
        is_list = request.query.is_list
        if is_list == 'true':
            return template('gallery_life_menu.tpl')
        else:
            jsonLife = ""
            parsed = req_item.split(' by ')
            life_id = parsed[0]
            author = parsed[1]
            conn = sqlite3.connect('./db/life.db')
            cur = conn.cursor()
            cur.execute('select world from lifes where id = ? and author= ? and type=2',(life_id,author))
            jsonLife = (cur.fetchone()[0]).encode('ascii', 'ignore')
            conn.commit()
            conn.close()
            return jsonLife
                
@route('/savelife')
def savelife():
    print("This part works")
    user_name = request.get_cookie("username", secret='MySecret')
    lifename =request.query.lifename
    visibility = request.query.visibility
    is_update = request.query.is_update
    print(is_update)
    _type = 1
    if visibility == 'private':
        _type = 1
    elif visibility == 'public':
        _type = 2
    world = request.query.cells
    print(lifename, visibility, world)
    conn = sqlite3.connect('./db/life.db')
    cur = conn.cursor()
    #pdb.set_trace()
    if is_update == 'false':
        try:
            cur.execute('select likes_count from lifes where id = ? and author=?',(lifename,user_name))
            #print(cur.fetchone())
            if cur.fetchone():
                return "EXISTS"
            else:
                cur.execute('insert into lifes values(?,?,?,?,?)',(user_name, world, lifename, _type, 0))
                conn.commit()
                return "OK"
        except Exception as e:
            print(e)
            return "SAVE FAILED"
    elif is_update == 'true':
        cur.execute('select likes_count from lifes where id = ? and author=?',(lifename,user_name))
        likecount = cur.fetchone()[0]
        try:
            cur.execute('update lifes set world = ? where id = ? and author=?',(world,lifename,user_name))
            conn.commit()
            return "OK"
        except Exception as e:
            cur.execute('insert into lifes values(?,?,?,?,?)',(user_name, world, lifename, _type, 0))
            conn.commit()
            print(e)
            return "SAVE FAILED"
    conn.close()
        
@route('/about')
def aboutpage():
    return template('about')

@route('/demo')
def demo_page():
    return template('demo')

@route('/app')
def app_page():
        return template('app')
@route('/images/<name>')
def image(name):
    return static_file(name, root='./images/')

@route('/css/<name>')
def css(name):
    return static_file(name, root='./css/')

@route('/js/<name>')
def js(name):
    return static_file(name, root='./js/')

@route('/fonts/<name>')
def font(name):
    return static_file(name, root='./fonts')

if __name__ == '__main__':
    run(host='localhost', port =8000, debug=True, reloader=True)

