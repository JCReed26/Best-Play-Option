from sqlalchemy import create_engine, text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from pathlib import Path
import os 

path = Path('BPO.sql')

def init_db(): 
    engine = create_engine(DATABASE_URL)
    #execute bpo.sql 
    with open(path) as f: 
        with engine.connect as conn:
            # single transaction 
            with conn.begin():
                for statement in f.read().split(';'):
                    if statement.strip():
                        print("It's working!") 
                        conn.execute(text(statement))
    
    return engine

# DB env variables 
DB_HOST = os.getenv("DB_HOST")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_PORT = os.getenv("DB_PORT")

# URL
DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

engine = init_db()

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

# Get database session 
def get_db(): 
    db = SessionLocal()
    try: 
        yield db
    finally: 
        db.close()

def test_db(): 
    db = SessionLocal()
    if db: 
        db.close()
        return "db working on backend db"
    else: return "this dont be working"

def execute_query(query, params=None):
    db = SessionLocal()
    with db.connection() as conn:
        result = conn.execute(text(query), params or {})
        return result.fetchall()