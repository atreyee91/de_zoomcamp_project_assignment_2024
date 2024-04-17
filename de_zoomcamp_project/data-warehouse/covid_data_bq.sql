CREATE EXTERNAL TABLE `covid_dataset_de_project.covid_data_all`
  OPTIONS (
    format ="Parquet",
    uris = ['gs://de_project_covid_dataset/covid_data/*.parquet']
    );
