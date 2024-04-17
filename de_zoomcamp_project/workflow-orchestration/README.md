Used Mage to extract, tranform and load the data from the API to GCS bucket and orchestrate the end to end pipeline.

## Overview

* `Extract`: Pull data from a source (API— Covid dataset)
* `Transform`: Data cleaning, transformation, and partitioning
* `Load`: API to Mage, Mage to GCS

## Files

* `data-exporters`: load it into GCS bucket
* `transformers`: transform data in mage
* `data-loaders`: load from api to mage

#### Execution steps

1.  Start the Docker container:

```bash
docker compose up
```

Now, navigate to http://localhost:6789 in your browser.

2.  Trigger the Pipeline (On Demand/Schedule): export_data_gcs_de_project
