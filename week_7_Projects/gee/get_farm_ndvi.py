import ee
import numpy as np
import pandas as pd
import geopandas as gpd
from datetime import datetime
import datetime
from datetime import timedelta
import geemap.core as geemap

email = "gee-functions@data-enginering-zoom-camp.iam.gserviceaccount.com"
key_file = "/content/data-enginering-zoom-camp-d547d133c38f.json"

# Authenticate and initialize
credentials = ee.ServiceAccountCredentials(email=email, key_file=key_file)
ee.Initialize(credentials)


# get today's day
today = datetime.date.today()
search_start = (today - datetime.timedelta(days=5)).strftime('%Y-%m-%d')
search_end = today.strftime('%Y-%m-%d')

def source_imagery(IMAGERY,BOUND):
  # Filter and process Sentinel-2 image collection
  dataset = (
    ee.ImageCollection(IMAGERY)
      .filterBounds(BOUND) # Filter to AOI box
      .filterDate(search_start,search_end)  # Filter for single day
      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 10))  # Pre-filter for less cloud cover
       #.first()  # Select the first image (you might want to select multiple for time series)
      .select(['B4', 'B8'])  # Select red (B4) and near-infrared (B8) bands
      .mosaic()
      .clip(BOUND)
    )
  return dataset


def getNDVI(image):

    # Normalized difference vegetation index (NDVI)
    ndvi = image.normalizedDifference(['B8','B4']).rename("NDVI")
    image = image.addBands(ndvi)

    return(image)

# define a helper function to put the geodataframe in the right format for constructing an ee object
def shp_to_ee_fmt(geodf):
    gdf = gpd.read_file(geodf)
    combine_poly = gdf.dissolve('landuse')
    data = json.loads(combine_poly.to_json())
    return data['features'][0]['geometry']['coordinates']




sentinel2_imagery = 'COPERNICUS/S2_SR_HARMONIZED'
farm_boundary = ee.Geometry.MultiPolygon(shp_to_ee_fmt(farmland))

image = source_imagery(sentinel2_imagery,farm_boundary)

ndvi = getNDVI(image)

# Set analysis parameters
scale = 100  # meters
step = 1000  # Step size for subset iteration

# Load farmland boundaries GeoDataFrame
farmland_gdf = gpd.read_file(farmland)

# Initialize an empty list to store GeoDataFrames from each subset
zone_stats_gdfs = []

# Iterate through subsets of farmland boundaries
for i in range(0, len(farmland_gdf), step):
    farmland_subset = farmland_gdf.iloc[i:i+step].copy()  # Slice and copy the subset
    features = ee.FeatureCollection(get_ee_features(farmland_subset))  # Convert to EE Features

    # Compute mean NDVI using Google Earth Engine
    zone_stats = ndvi.reduceRegions(
        collection=features, reducer=ee.Reducer.mean(), scale=scale
    ).getInfo()

    # Create a GeoDataFrame from the mean NDVI values and append to the list
    zone_stats_gdf = gpd.GeoDataFrame.from_features(zone_stats['features'], crs='EPSG:4326')
    zone_stats_gdfs.append(zone_stats_gdf)

# Concatenate all GeoDataFrames in the list into a single GeoDataFrame
final_zone_stats_gdf = pd.concat(zone_stats_gdfs, ignore_index=True)

