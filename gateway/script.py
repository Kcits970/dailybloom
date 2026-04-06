import psycopg2

try:
    conn = psycopg2.connect(
        host="postgres",
        database="testdb",
        user="testuser",
        password="test"
    )

    cur = conn.cursor()
    cur.execute("SELECT * FROM users;")
    rows = cur.fetchall()
    print("--- 쿼리 결과 ---")
    for row in rows:
        print(row)

    cur.close()
    conn.close()

except Exception as e:
    print(f"데이터베이스 연결 오류: {e}")
