import os
import asyncpg

# Load .env if you're running this outside of Docker
from dotenv import load_dotenv
load_dotenv()

def load_sql(path): 
    with open(path, 'r') as file: 
        return file.read()

# Dynamically load DB config from environment
DB_CONFIG = {
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("DB_NAME"),
    "host": os.getenv("DB_HOST"),
    "port": os.getenv("DB_PORT", "5432")
}

async def execute_query(sql_path, params=None, fetch=False):
    sql = load_sql(sql_path)
    conn = await asyncpg.connect(**DB_CONFIG)
    try:
        if fetch:
            result = await conn.fetch(sql, *params.values()) if params else await conn.fetch(sql)
            return result
        else:
            await conn.execute(sql, *params.values()) if params else await conn.execute(sql)
    finally:
        await conn.close()
