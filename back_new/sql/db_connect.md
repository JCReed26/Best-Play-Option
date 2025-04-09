To initialize the tables of your database and then use SQL files with queries in your code, you'll need to follow a few steps. Here's an overview of the process:

1. **Connect to your RDS instance**
   - Use the PostgreSQL client (psql) to connect to your RDS instance from your EC2 instance.
   - Command: `psql -h [RDS_ENDPOINT] -U [USERNAME] -d [DATABASE_NAME]`
   - You'll be prompted for the password.

2. **Create database schema**
   - Once connected, you can create your database schema and tables.
   - You can do this by running SQL commands directly in the psql client.

3. **Prepare SQL files**
   - Create SQL files containing your queries.
   - Store these files on your EC2 instance or in a version control system.

4. **Execute SQL files**
   - You can execute SQL files using psql with the following command:
     ```
     psql -h [RDS_ENDPOINT] -U [USERNAME] -d [DATABASE_NAME] -f [SQL_FILE_PATH]
     ```

5. **Integrate with your application code**
   - In your application code, you can use a database library (like psycopg2 for Python) to connect to the RDS instance and execute queries.
   - You can read the SQL files and execute them as needed in your application.

Remember to follow security best practices:
- Use the principle of least privilege when setting up database user permissions.
- Store sensitive information like database credentials securely, using AWS Secrets Manager or similar services.
- Regularly update and patch your EC2 instance and RDS database.

By following these steps, you'll be able to initialize your database tables and incorporate SQL queries from files into your application code. Always test your database operations in a safe, non-production environment before implementing in production.