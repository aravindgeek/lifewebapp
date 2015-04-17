<!doctype html>
%import sqlite3
%conn = sqlite3.connect('./db/life.db')
%cur = conn.cursor()
%cur.execute('select id, author from lifes where type=2')
%for life in cur:
    % value = type(life)
    % l = life[0].encode('ascii', 'ignore')
    % a = life[1].encode('ascii', 'ignore')
    <li class="pure-menu-item"><a class="pure-menu-link gallery-life-link">{{l}} by {{a}}</a></li>
%end

                
