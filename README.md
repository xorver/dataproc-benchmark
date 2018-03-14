# dataproc-benchmark

Dataproc benchmarking tutorial

## Slides

https://docs.google.com/presentation/d/1cPP6WwnYq8RAEy5y_1sJOnzJGr7NJylr3_BQknDvlFg/edit?usp=sharing

## Code snippets

Install SDK https://cloud.google.com/sdk/docs/quickstarts

```bash
> wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-189.0.0-darwin-x86_64.tar.gz
> tar xzf google-cloud-sdk-189.0.0-darwin-x86_64.tar.gz
> ./google-cloud-sdk/install.sh
```

Init gcloud - login, setup default project and zone

```bash
> gcloud init
```

Create google cloud storage bucket

```bash
> gsutil mb gs://5spoc-benchmark-data
```

Upload csv data of format `csv/table_name/*.csv` (in our case those are: product, calendar, store, daily_sales, daily_waste, daily_stock).

```bash
> gsutil -m cp -r csv gs://5spoc-benchmark-data/
```

Upload schema init scripts to created bucket

```bash
> gsutil -m cp init_scripts/schema.sh gs://5spoc-benchmark-data/
> gsutil -m cp schema/schema.hql gs://5spoc-benchmark-data/
```

Create small computing cluster and load schema on start

```bash
> gcloud dataproc clusters \
    create small-cluster-to-convert-data \
    --master-machine-type n1-standard-2 \
    --num-workers 2 \
    --worker-machine-type n1-standard-2 \
    --initialization-actions gs://5spoc-benchmark-data/schema.sh
```

Ssh to master node

```bash
> gcloud compute ssh small-cluster-to-convert-data-m
```

Kill small cluster

```bash
> gcloud dataproc clusters delete \
   small-cluster-to-convert-data
```

Upload init script for copying to hdfs

```bash
> gsutil -m cp init_scripts/copy_data_to_local_hdfs.sh gs://5spoc-benchmark-data/
```

Create normal cluster with presto

```bash
> gcloud dataproc clusters \
    create medium-cluster \
    --zone europe-west1-b \
    --master-machine-type n1-standard-4 \
    --num-workers 4 \
    --worker-machine-type n1-standard-4 \
    --initialization-actions 'gs://5spoc-benchmark-data/copy_data_to_local_hdfs.sh,gs://5spoc-benchmark-data/schema.sh,gs://dataproc-initialization-actions/presto/presto.sh
'
```

Ssh to master node

```bash
> gcloud compute ssh medium-cluster-m
```

Query hive

```bash
lichon@small-cluster-to-convert-data-m:~$ hive
hive> select * from product_parquet;
```

Query spark-sql

```bash
lichon@small-cluster-to-convert-data-m:~$ spark-sql
hive> select * from product_parquet;
```

Query presto

```bash
lichon@small-cluster-to-convert-data-m:~$ presto --catalog hive --schema default
hive> select * from product_parquet;
```