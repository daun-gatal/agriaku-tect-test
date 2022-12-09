# agriaku-tect-test 
Simple ETL processing with Python. Source and destination using PostgreSQL database.

### Requirements
1. Python v3.11
2. Docker v4.14
3. Dbeaver

### Step-by-Step
1. Clone this repo and enter to the root
2. Please deploy postgres container with command `docker run --name postgres-dev -e POSTGRES_PASSWORD=postgres -d postgres`
3. Install `requirements.txt` by `pip install -r requirements.txt`
4. Copy and run source schema DDL `schema/source/source.sql` to `postgres` container using command `docker cp ./schema/source/source.sql postgres:/tmp/ && docker exec -it postgres psql -U postgres -d postgres -f /tmp/source.sql`
5. Run python script to build fact table using command ` python main.py --username postgres --password postgres --host localhost --port 5432 --dbname postgres --target-table fact_course_attendance_report`
6. Check your fact table. It should be in `public` schema of `postgres` database