if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):

    data['lpep_pickup_date'] =  data.lpep_pickup_datetime.dt.date

    #rename columns
    data.rename(columns={'VendorID':'vendor_id',
                'RatecodeID':'ratecode_id',
                'PULocationID':'pulocation_id',
                'DOLocationID':'dolocation_id'})
    
    print("Row with zero passenger", data['passenger_count'].isin([0]).sum())
    print("Row with zero trip distance", data['trip_distance'].isin([0]).sum())

    data = data[(data['passenger_count']> 0) & (data['trip_distance']> 0)]

    return data

@test
def test_output(output, *args) -> None:
    assert output['vendor_id'] == True, 'column exist'
    assert output['passenger_count'].isin([0]).sum() == 0, 'There are ride with no passenger'
    assert output['trip_disance'].isin([0]).sum() == 0, 'There are trip with 0 distance'

