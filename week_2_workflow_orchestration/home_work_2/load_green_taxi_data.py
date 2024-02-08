import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):

    url_list = ['https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2020-10.csv.gz',
            'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2020-11.csv.gz',
            'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2020-12.csv.gz'
        ]
    
    taxi_dtypes = {
        'VendorId': pd.Int64Dtype(),
        'passenger_count': pd.Int64Dtype(),
        'trip_distance': float,
        'RatecodeID': pd.Int64Dtype(),
        'store_and_fwd_flag':str,
        'PULocationID':pd.Int64Dtype(),
        'DOLocationID': pd.Int64Dtype(),
        'payment_type': pd.Int64Dtype(),
        'fare_amount':float,
        'extra':float,
        'mta_tax': float,
        'tip_amount':float,
        'trolls_amount': float,
        'improvement_surcharge':float,
        'total_amount': float,
        'congestion_surcharge':float
    }
    
    parse_dates = ['tpep_pickup_datetime', 'tpep_dropoff_datetime']


    # Initialize an empty list to store DataFrames
    dfs = []

    # Loop through each URL in url_list and read CSV into DataFrame
    for url in url_list:
        df = pd.read_csv(url, sep=',', dtype=taxi_dtypes, parse_dates=parse_dates)
        print(df.head())
        dfs.append(df)

    # Concatenate all DataFrames in the list
    concat_df = pd.concat(dfs, ignore_index=True)

    return concat_df