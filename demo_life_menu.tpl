<!doctype html>
%import sqlite3
%conn = sqlite3.connect('./db/life.db')
%cur = conn.cursor()
%cur.execute('select id from lifes where type=0')
%for life in cur:
    % l = life[0].encode('ascii', 'ignore')
    <li class="pure-menu-item"><a class="pure-menu-link demo-life-link">{{l}}</a></li>
%end

                
