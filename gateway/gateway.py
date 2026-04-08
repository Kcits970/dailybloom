import os, psycopg2
from flask import Flask, request, jsonify

def get_conn_obj():
    try:
        return psycopg2.connect(
            host=os.environ['POSTGRES_HOST'],
            dbname=os.environ['POSTGRES_DB'],
            user=os.environ['POSTGRES_USER'],
            password=os.environ['POSTGRES_PASSWORD']
        )
    except:
        return None

app = Flask(__name__)

@app.route('/')
def welcome():
    return jsonify({"message": "Welcome to DailyBloom!"}), 200

@app.route('/login', methods=['POST'])
def check_user():
    conn = get_conn_obj()
    curs = conn.cursor()
    response = None

    data = request.get_json()
    curs.execute(f"SELECT * FROM users WHERE login_info = '{data['login_info']}'")
    result = curs.fetchone()
    if result is None:
        response = {"status": 1, "message": "no such user exists"}
    else:
        response = {"status": 0, "id": result[0], "nickname": result[2]}

    curs.close()
    conn.close()
    return jsonify(response), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
