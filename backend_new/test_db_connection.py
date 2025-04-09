import os
import psycopg2
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Get database connection details from environment variables
DB_HOST = os.getenv("DB_HOST")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_PORT = os.getenv("DB_PORT")

def main():
    # Connect to the database
    print(f"Connecting to {DB_HOST}:{DB_PORT}/{DB_NAME} as {DB_USER}...")
    
    try:
        # Establish connection
        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            port=DB_PORT
        )
        
        # Create a cursor
        cur = conn.cursor()
        
        # Create a simple test table if it doesn't exist
        cur.execute("""
        CREATE TABLE IF NOT EXISTS test_connection (
            id SERIAL PRIMARY KEY,
            message TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
        """)
        
        # Insert a test record
        cur.execute("""
        INSERT INTO test_connection (message) 
        VALUES ('Hello from local machine!') 
        RETURNING id, message, created_at
        """)
        
        # Fetch and print the inserted record
        record = cur.fetchone()
        print(f"Inserted record: ID={record[0]}, Message='{record[1]}', Created at {record[2]}")
        
        # Commit the transaction
        conn.commit()
        
        # Close the cursor and connection
        cur.close()
        conn.close()
        
        print("Database connection test successful!")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
