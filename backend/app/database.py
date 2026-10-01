import os
from sqlalchemy import create_engine
from dotenv import load_dotenv
from sqlalchemy import text
load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL")

engine = create_engine(DATABASE_URL)



def test_connection():
    try:
        with engine.connect() as connection:
            connection.execute(text("SELECT 1"))
        return True
    except Exception as e:
        print("Database connection failed:", e)
        return False