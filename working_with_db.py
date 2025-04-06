import pandas as pd
import psycopg2


def connect_to_local_postgresql(db_name, user, password, host='localhost', port=5432):
    try:
        connection = psycopg2.connect(
            dbname=db_name,
            user=user,
            password=password,
            host=host,
            port=port
        )
        print("Connection to DB successful")
        return connection
    except Exception as e:
        print(f"Error connecting to DB: {e}")
        return None


def execute_query_to_dataframe(connection, query):
    try:
        with connection.cursor() as cursor:
            cursor.execute(query)
            result = cursor.fetchall()
            column_names = [desc[0] for desc in cursor.description]
            return pd.DataFrame(result, columns=column_names)
    except Exception as e:
        print(f"Error executing the query: {e}")
        return pd.DataFrame()


def read_sql_file_to_string(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            sql_query = file.read()
        return sql_query
    except Exception as e:
        print(f"Error reading SQL file: {e}")
        return None
