#!/usr/bin/env python2
from bottle import route, run, template, static_file
@route('/')
@route('/home')
def home_page():
    return template('home',name="Aravindhan")

@route('/login')
def home_page():
    return template('login')
@route('/newuser')
def home_page():
    return template('new_user')

@route('/resetpwd')
def home_page():
    return template('reset_password')
@route('/about')
def home_page():
    return template('about')

@route('/demo')
def home_page():
    return template('demo')

@route('/images/<name>')
def image(name):
    return static_file(name, root='./images/')

@route('/css/<name>')
def css(name):
    return static_file(name, root='./css/')

@route('/js/<name>')
def css(name):
    return static_file(name, root='./js/')

run(host='localhost', port =8080, debug=True, reloader=True)
