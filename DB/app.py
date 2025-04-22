from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
import os

# Load environment variables from .env
load_dotenv()

# Initialize Flask app
app = Flask(__name__)

# Configure the database connection
app.config['SQLALCHEMY_DATABASE_URI'] = (
    f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}"
    f"@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy
db = SQLAlchemy(app)

# ----------------------------
# Routes
# ----------------------------

@app.route('/')
def home():
    return "database connected and running"

@app.route('/test')
def test():
    return "Flask is running and reachable!"


'''

@app.route('/test-db')
def test_db():
    try:
        sql_path = 'queries/get_players.sql'
        result = asyncio.run(execute_query(sql_path))
        # list of dictionaries
        tables = [dict(row) for row in result]
        return jsonify(tables)
    except Exception as e:
        return f"DB connection failed: {e}"

# WARNING NOT VIABLE FOR PRODUCTION
@app.route('/create-user')
def create_user(username, password, email): 
    try: 
        sql_path = 'queries/create-users.sql'
        result = asyncio.run(execute_query(sql_path, {'user': username }, {'password': password }, {'email': email }, fetch=True))
        return result
    except Exception as e:
        return "DB error: {e}"

'''

# ----------------------------
# App Runner
# ----------------------------

if __name__ == '__main__':
    app.run(debug=True)
