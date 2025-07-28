from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

DB_PARAMS = {
    "dbname": "my-app-db",
    "user": "postgres",
    "password": "postgres",
    "host": "postgres",
    "port": "5432"
}

def get_connection():
    return psycopg2.connect(**DB_PARAMS)

def init_db():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("""
        CREATE TABLE IF NOT EXISTS lucky_messages (
            id SERIAL PRIMARY KEY,
            message TEXT NOT NULL
        );
    """)
    cur.execute("SELECT COUNT(*) FROM lucky_messages;")
    count = cur.fetchone()[0]
    if count == 0:
        cur.execute("""
            INSERT INTO lucky_messages (message) VALUES
            ('You will have a great day!'),
            ('Success is around the corner.'),
            ('Something wonderful is about to happen.');
        """)
    conn.commit()
    cur.close()
    conn.close()

@app.route("/lucky")
def lucky_message():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT message FROM lucky_messages ORDER BY RANDOM() LIMIT 1;")
    result = cur.fetchone()
    cur.close()
    conn.close()
    return jsonify({"lucky_message": result[0] if result else "No messages found."})

if __name__ == "__main__":
    init_db()
    app.run(host="0.0.0.0", port=5000)
