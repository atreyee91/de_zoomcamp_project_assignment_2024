import pyarrow as pa
import pyarrow.parquet as pq 
import os

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/mage-gcp.json"

bucket_name = 'de_project_covid_dataset'

project_id = 'dezoomcamp-411909'

table_name = "covid_data"

root_path = f'{bucket_name}/{table_name}'


@data_exporter
def export_data(data, *args, **kwargs):
   table = pa.Table.from_pandas(data)

   # Check if the file already exists in GCS
   if os.path.exists(root_path):
    # If file exists, remove it
    os.remove(root_path)

   gcs = pa.fs.GcsFileSystem()

   pq.write_to_dataset(
    table,
    root_path=root_path,
    #partition_cols=['date'],
    filesystem=gcs
   )
