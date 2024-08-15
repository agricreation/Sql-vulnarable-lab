import psycopg2
from flask import Flask, request

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect("dbname=vulnerable_db user=user password=password host=db")
    return conn

@app.route('/user/<username>', methods=['GET'])
def get_user(username):
    conn = get_db_connection()
    cursor = conn.cursor()
    print('executing')

    # Vulnerable SQL query
    query = f"SELECT * FROM users WHERE username = '{username}'"
    print(query)
    cursor.execute(query)
    user_info = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return {"user_info": user_info}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
