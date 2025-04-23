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

# TODO match names to team name in the database 
team_options = [
    { "id": "1", "name": "Bal Ravens" },
    { "id": "2", "name": "Buff Bills" },
    { "id": "3", "name": "Cin Bengals" },
    { "id": "4", "name": "Cle Browns" },
    { "id": "5", "name": "Den Broncos" },
    { "id": "6", "name": "Hou Texans" },
    { "id": "7", "name": "Ind Colts" },
    { "id": "8", "name": "Jax Jaguars" },
    { "id": "9", "name": "KC Chiefs" },
    { "id": "10", "name": "LV Raiders" },
    { "id": "11", "name": "LA Chargers" },
    { "id": "12", "name": "Mia Dolphins" },
    { "id": "13", "name": "NE Patriots" },
    { "id": "14", "name": "NY Jets" },
    { "id": "15", "name": "Pitt Steelers" },
    { "id": "16", "name": "Ten Titans" },
    { "id": "17", "name": "Ari Cardinals" },
    { "id": "18", "name": "Atl Falcons" },
    { "id": "19", "name": "Car Panthers" },
    { "id": "20", "name": "Chi Bears" },
    { "id": "21", "name": "Dal Cowboys" },
    { "id": "22", "name": "Det Lions" },
    { "id": "23", "name": "GB Packers" },
    { "id": "24", "name": "LA Rams" },
    { "id": "25", "name": "Min Vikings" },
    { "id": "26", "name": "NO Saints" },
    { "id": "27", "name": "NY Giants" },
    { "id": "28", "name": "Phi Eagles" },
    { "id": "29", "name": "SF 49ers" },
    { "id": "30", "name": "Stl Seahawks" },
    { "id": "31", "name": "TB Bucks" },
    { "id": "32", "name": "Was Commanders" },
]

def getTeamName(teamid): 
    for option in team_options:
        if option["id"] == str(teamid):
            return option["name"]
    return ""


def open_sql_file(filename): 
    try:
        with open(filename, 'r') as f: 
            sql = f.read()
            return sql
    except Exception as e: 
        return e



# api stuff 
load_dotenv()

app = Flask(__name__)
url = os.getenv("DB_URL")
print(url)
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

# TODO match all functions above to aggregate to be the post request with this style 
@app.post("/api/search-print")
def search_print():
    data = request.get_json()
    teamid = data.get("teamid")
    
    if not teamid:
        return {"error": "Missing team ID in request body"}, 400
        
    team_name = getTeamName(teamid)
    if not team_name:
        return {"error": "Invalid team ID"}, 404
        
    try: 
        with connection: 
            with connection.cursor() as cursor: 
                query = open_sql_file('sql/search-print.sql')
                cursor.execute(query, (team_name, team_name))
                players = cursor.fetchall()
                return {
                    "team": team_name,
                    "players": [{"player": p[1], "position": p[2], "rating": p[3]} for p in players]
                }
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
