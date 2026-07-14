---
name: etl-development
description: ETL pipeline development for extracting, transforming, and loading data. Use to create data pipelines.
---

# ETL Development

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for developing ETL (Extract, Transform, Load) pipelines. Includes data extraction from various sources, transformation, and loading into target systems.

## When to Use

Use this skill:
- For creating data pipelines
- For data integration
- When migrating between systems
- For data warehousing
- When creating real-time pipelines
- For scheduled data loads

## ETL Patterns

### Batch ETL

```python
# Classic batch ETL
import pandas as pd

def extract():
    """Data extraction"""
    df = pd.read_sql("SELECT * FROM source", source_conn)
    return df

def transform(df):
    """Data transformation"""
    df['cleaned'] = df['raw'].str.strip().str.lower()
    df['calculated'] = df['value'] * 1.1
    return df

def load(df):
    """Load to target system"""
    df.to_sql('target_table', target_conn, if_exists='append')

# Execution
data = extract()
transformed = transform(data)
load(transformed)
```

### Streaming ETL

```python
# Apache Kafka + Flink
from kafka import KafkaConsumer, KafkaProducer

consumer = KafkaConsumer(
    'source_topic',
    bootstrap_servers='kafka:9092',
    value_deserializer=lambda m: json.loads(m.decode('utf-8'))
)

producer = KafkaProducer(
    'target_topic',
    bootstrap_servers='kafka:9092',
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)

for message in consumer:
    data = message.value
    # Transform
    data['processed'] = data['value'] * 1.1
    producer.send('target_topic', data)
```

## Tools

| Tool | Use Case |
|------|----------|
| Apache Airflow | Orchestration |
| dbt | Data transformation |
| Apache Spark | Large-scale ETL |
| Talend | Commercial ETL |
| AWS Glue | Cloud ETL |
| Apache NiFi | Data flow |

## Airflow DAG Example

```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'data_engineer',
    'depends_on_past': False,
    'start_date': datetime(2024, 1, 1),
}

with DAG('etl_pipeline', default_args=default_args, schedule_interval='@daily') as dag:
    
    extract = PythonOperator(
        task_id='extract_data',
        python_callable=extract
    )
    
    transform = PythonOperator(
        task_id='transform_data',
        python_callable=transform
    )
    
    load = PythonOperator(
        task_id='load_data',
        python_callable=load
    )
    
    extract >> transform >> load
```

## Data Quality Checks

```python
def data_quality_checks(df):
    """Data quality checks"""
    checks = {
        'row_count': len(df) > 0,
        'no_nulls': df['id'].notna().all(),
        'unique_ids': df['id'].nunique() == len(df),
        'valid_dates': pd.to_datetime(df['date'], errors='coerce').notna().all()
    }
    
    for check, result in checks.items():
        if not result:
            raise ValueError(f"Data quality check failed: {check}")
    
    return checks
```

## Error Handling

```python
from airflow.models import TaskInstance
from airflow.utils.state import State

def handle_failure(context):
    """Error handling"""
    ti = context['task_instance']
    ti.state = State.FAILED
    
    # Send alert
    send_alert(
        task_id=context['task_instance_key'],
        error=context['exception']
    )
```

## Monitoring

```python
# Metrics for monitoring
metrics = {
    'records_extracted': len(source_df),
    'records_loaded': len(target_df),
    'records_failed': len(failed_records),
    'processing_time': end_time - start_time,
    'throughput': len(target_df) / (end_time - start_time)
}
```

## Quality Criteria

- [ ] Source systems connected
- [ ] Transformations documented
- [ ] Data quality checks configured
- [ ] Error handling implemented
- [ ] Monitoring configured
- [ ] Backfills supported
- [ ] Logging complete