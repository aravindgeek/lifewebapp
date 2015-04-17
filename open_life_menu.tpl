<!doctype html>
%import sqlite3
%conn = sqlite3.connect('./db/life.db')
%cur = conn.cursor()
%user_name = get(name)
<p> {{user_name}}<p>
<p> {{name}}<p>
%cur.execute('select id from lifes where author=?',(user_name,))
%for life in cur:
    % l = life[0].encode('ascii', 'ignore')
    <li class="pure-menu-item"><a class="pure-menu-link open-life-link">{{l}}</a></li>
%end


                
                
