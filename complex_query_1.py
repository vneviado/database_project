import psycopg2 as pg2
import sys

con = pg2.connect(database='snapchat',user='isdb')
con.autocommit = True
cur = con.cursor()

def send_snaps(sender, recipients, duration, media, location, filterId):
    getid = '''select max(snapId) from Snap;'''
    
    getValidFriends = '''select username2
    from Friendships
    where username1 = '%s';'''
                 
    insertSnap = '''insert into Snap values (%s,%s,%s,%s,%s,%s);'''
    insertViews = '''insert into SnapView values (%s,%s,false);'''
    
    cmd = cur.mogrify(getid)
    print(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    print(rows)
    for row in rows:
        newId = row
    newId = int(newId[0])
    newId += 1
    print()
    print()
    
    print(getValidFriends % sender)
    cur.execute(getValidFriends % sender)
    rows = cur.fetchall()
    print(rows)
    print()
    print()
    sendTo = []
    for row in rows:
        if row[0] in recipients:
            sendTo.append(row)
    
    
    
    cmd = cur.mogrify(insertSnap, (duration,media, 
                                    newId, location,
                                    filterId,sender))
    print(cmd)
    cur.execute(cmd)
    print()
    print()
    
    
    for recipient in sendTo:
        cmd = cur.mogrify (insertViews, (newId,recipient))
        print(cmd)
        cur.execute(cmd)
        print()
        print()
        
send_snaps('dlizhang98',['asager','ieu','margretw'], 5, 'https://snap416.png','48 00N 54 40E', 5);