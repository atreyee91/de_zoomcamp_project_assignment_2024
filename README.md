## Course Project

### Objective

The goal of this project is to build an end-to-end data pipeline.

## Data Pipeline 

I have used **batch** pipelines which have been scheduled at daily interval.

## Technologies Used

* **Cloud**: GCP
* **Infrastructure as code (IaC)**: Terraform
* **Workflow orchestration**: Mage
* **Data Warehouse**: BigQuery
* **Batch processing**: Spark
* **Analytical processing**: DBT
* **Dashboard**: Looker

## Dataset Used

* `url`: 'https://covid.ourworldindata.org/data/owid-covid-data.csv'
* `Description`: This covid dataset has daily level information on the number of affected cases, deaths and recovery from 2019 novel coronavirus. 

## File Structure

1. `terraform`: Used to deploy objects (GCS buckets, BigQuery Datasets) in GCP
2. `workflow-orchestration`: Used to Extract data from API, apply transformation and load the data in GCS bucket. Also orchestrated the end to end pipeline using mage
3. `data-warehouse`: Used to transfer the data to BigQuery dataset from GCS Bucket
4. `analytics-engineering`: Used to create analytical dataset optimized for reporting needs and deploy it in BigQuery using DBT(Data Building Tool)
5. `dashboard`: Used Looker to create interactive dashboards which gives a detail analysis of covid cases accorss global locations since 2019
