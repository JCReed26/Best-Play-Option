import asyncpg
from utils.sql_loader import load_sql

DB_CONFIG = {
    "username": "your_user",
    "password": "your_password",
}

def load_sql(path): 
    with open(path, 'r') as file: 
        return file.read()

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