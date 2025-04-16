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
    return "✅ Backend is connected and running!"

@app.route('/test')
def test():
    return "Flask is running and reachable!"

@app.route('/test-db')
def test_db():
    try:
        # Run a simple test query
        result = db.session.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='public';")
        tables = [row[0] for row in result]
        return f"Connected to DB! Found tables: {tables}"
    except Exception as e:
        return f"❌ DB connection failed: {e}"

# ----------------------------
# App Runner
# ----------------------------

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
