import os, psycopg2

try:
    conn = psycopg2.connect(
        host=os.environ['POSTGRES_HOST'],
        dbname=os.environ['POSTGRES_DB'],
        user=os.environ['POSTGRES_USER'],
        password=os.environ['POSTGRES_PASSWORD']
    )

    q = "SELECT * FROM users;"
    cur = conn.cursor()
    cur.execute(q)
    rows = cur.fetchall()
    print("query returned successfully")
    cur.close()
    conn.close()

except Exception as e:
    print("error")
    print(e)
