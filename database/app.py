import os
import psycopg2
from dotenv import load_dotenv
from flask import Flask, request

CREATE_USER_TABLE = (
    "CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY, name TEXT, password TEXT, email TEXT);"
)
INSERT_USER_RET_ID = (
    "INSERT INTO users (name) VALUES (%s) RETURNING id;"
)

def open_sql_file(filename): 
    try:
        with open(filename, 'r') as f: 
            sql = f.read()
            return sql
    except Exception as e: 
        return e


load_dotenv()

app = Flask(__name__)
url = os.getenv("DB_URL")
connection = psycopg2.connect(url)

@app.get("/")
def home(): 
    print("req hello")
    return {"message": "Hello World from Database!"}

@app.get("/api/all-users")
def get_users():
    try: 
        with connection: 
            with connection.cursor() as cursor: 
                cursor.execute(open_sql_file('sql/all-users.sql'))
                users = cursor.fetchall()
                return [{"id": u[0], "name": u[1]} for u in users]
    except Exception as e: 
        return {"Error": str(e)}, 400

@app.post("/api/test")
def create_user():
    try:
        data = request.get_json()
        name = data["name"] #assume user sent the name value 
        with connection: 
            with connection.cursor() as cursor: 
                cursor.execute(CREATE_USER_TABLE)
                cursor.execute(INSERT_USER_RET_ID, (name,))
                user_id = cursor.fetchone()[0]
        return {"id": user_id, "message": f"User {name} created."}, 201
    except Exception as e: 
        return {"Error": str(e)}, 400

@app.get("/api/aggregate")
def aggregate():
    try: 
        with connection: 
            with connection.cursor() as cursor: 
                cursor.execute(open_sql_file('sql/aggregate.sql'))
                data = cursor.fetchall()
                return [{"id": d[0], "name": d[1], "count": d[2]} for d in data]
    except Exception as e: 
        return {"Error": str(e)}, 400
    
@app.get("/api/delete-record")
def delete_record():
    try: 
        with connection: 
            with connection.cursor() as cursor: 
                cursor.execute(open_sql_file('sql/delete-record.sql'))
                data = cursor.fetchall()
                return [{"id": d[0], "name": d[1], "count": d[2]} for d in data]
    except Exception as e: 
        return {"Error": str(e)}, 400
    
@app.get("/api/insert-record")
def insert_record():
    try: 
        with connection: 
            with connection.cursor() as cursor: 
                cursor.execute(open_sql_file('sql/insert-record.sql'))
                data = cursor.fetchall()
                return [{"id": d[0], "name": d[1], "count": d[2]} for d in data]
    except Exception as e: 
        return {"Error": str(e)}, 400
    
@app.get("/api/join-tables")
def join_tables():
    try: 
        with connection: 
            with connection.cursor() as cursor: 
                cursor.execute(open_sql_file('sql/join-tables.sql'))
                data = cursor.fetchall()
                return [{"id": d[0], "name": d[1], "count": d[2]} for d in data]
    except Exception as e: 
        return {"Error": str(e)}, 400
    
@app.get("/api/search-print")
def search_print():
    try: 
        with connection: 
            with connection.cursor() as cursor: 
                cursor.execute(open_sql_file('sql/search-print.sql'))
                data = cursor.fetchall()
                return [{"id": d[0], "name": d[1], "count": d[2]} for d in data]
    except Exception as e: 
        return {"Error": str(e)}, 400

@app.get("/api/update-record")
def update_record():
    try: 
        with connection: 
            with connection.cursor() as cursor: 
                cursor.execute(open_sql_file('sql/update-record.sql'))
                data = cursor.fetchall()
                return [{"id": d[0], "name": d[1], "count": d[2]} for d in data]
    except Exception as e: 
        return {"Error": str(e)}, 400