import multiprocessing
from shapely.geometry import MultiPolygon, Polygon
from shapely.ops import unary_union
import numpy as np
import pandas as pd
import geopandas as gpd









# define a helper function to put the geodataframe in the right format for constructing an ee object
def shp_to_ee_fmt(geodf):
    gdf = gpd.read_file(geodf)
    combine_poly = gdf.dissolve('landuse')
    data = json.loads(combine_poly.to_json())
    return data['features'][0]['geometry']['coordinates']

def shapely_to_ee_feature(geom, tolerance=0.01):
    """Converts Shapely geometry to Earth Engine Feature."""
    # Simplify the geometry if it's a Polygon or MultiPolygon
    if geom.geom_type == 'Polygon':
        geom = geom.simplify(tolerance)
    elif geom.geom_type == 'MultiPolygon':
        simplified_geoms = [sub_geom.simplify(tolerance) for sub_geom in geom.geoms]
        geom = MultiPolygon(simplified_geoms)
    else:
        raise ValueError("Unsupported geometry type")

    # Convert the simplified geometry to EE Feature
    if geom.geom_type == 'MultiPolygon':
        coords = [list(sub_geom.exterior.coords) for sub_geom in geom.geoms]
    else:
        coords = list(geom.exterior.coords)
    return ee.Feature(ee.Geometry.Polygon(coords))

def get_ee_features(gdf):
    """Converts GeoDataFrame geometries to Earth Engine Features."""
    return [shapely_to_ee_feature(row.geometry) for idx, row in gdf.iterrows()]

# Function to process each subset and compute mean NDVI
def process_subset(subset):
    features = ee.FeatureCollection(get_ee_features(subset))  # Convert to EE Features
    zone_stats = ndvi.reduceRegions(
        collection=features, reducer=ee.Reducer.mean(), scale=scale
    ).getInfo()
    zone_stats_gdf = gpd.GeoDataFrame.from_features(zone_stats['features'], crs='EPSG:4326')
    return zone_stats_gdf


# Load farmland boundaries GeoDataFrame
    farmland_gdf = gpd.read_file(farmland)

    # Split farmland boundaries into subsets
    subsets = [farmland_gdf.iloc[i:i+step].copy() for i in range(0, len(farmland_gdf), step)]

    # Initialize a multiprocessing pool
    pool = multiprocessing.Pool()

    # Process subsets in parallel and collect results
    zone_stats_gdfs = pool.map(process_subset, subsets)

    # Close the multiprocessing pool
    pool.close()
    pool.join()

    # Concatenate all GeoDataFrames in the list into a single GeoDataFrame
    final_zone_stats_gdf = pd.concat(zone_stats_gdfs, ignore_index=True)

