import argparse

from destination.query import DestinationQuery
from destination.load import LoadToDestination


def main(username: str,
         password: str,
         host: str,
         port: str,
         dbname: str,
         target_table_name: str):

    # Initialize load query
    q = DestinationQuery().query

    # Initialize load class
    job = LoadToDestination(username=username, password=password, host=host, port=port, dbname=dbname)

    # Get destination data based on query
    df = job.get_load_data(q)

    job.save_to_destination(df, target_table_name)

    # Close conn to database
    job.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--username", type=str, required=True, help="Username of source db")
    parser.add_argument("--password", type=str, required=True, help="Password of source db")
    parser.add_argument("--host", type=str, required=True, help="Host of source db")
    parser.add_argument("--port", type=str, required=True, help="Port of db")
    parser.add_argument("--dbname", type=str, required=True, help="Database name")
    parser.add_argument("--target-table", type=str, required=True, help="Target table name")

    args = parser.parse_args()

    try:
        main(username=args.username,
             password=args.password,
             host=args.host,
             port=args.port,
             dbname=args.dbname,
             target_table_name=args.target_table)

    except Exception as e:
        raise e
