---
name: data-quality
description: Data quality assurance, profiling, monitoring, data quality management. Use to maintain data quality.
---

# Data Quality

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for data quality assurance. Includes profiling, validation, monitoring, and fixing data quality issues.

## When to Use

Use this skill:
- For data profiling
- For data validation
- When setting up quality monitoring
- For creating data quality reports
- When integrating data quality into pipelines
- For data quality management

## Data Quality Dimensions

| Dimension | Description |
|-----------|-------------|
| Accuracy | Data is correct |
| Completeness | No missing values |
| Consistency | No contradictions |
| Timeliness | Data is up-to-date |
| Uniqueness | No duplicates |
| Validity | Follows format rules |

## Data Profiling

### Column Analysis

```python
import pandas as pd
import ydata_profiling as ydprofile

def profile_data(df):
    """Data profiling"""
    report = ydprofile.ProfileReport(df)
    report.to_file("data_profile.html")
    return report
```

### Basic Statistics

```sql
-- Column statistics
SELECT 
    column_name,
    data_type,
    COUNT(*) as total_count,
    COUNT(DISTINCT column_name) as unique_count,
    COUNT(column_name) as non_null_count,
    MIN(column_name) as min_value,
    MAX(column_name) as max_value
FROM information_schema.columns
WHERE table_name = 'my_table'
GROUP BY column_name, data_type;
```

## Data Validation Rules

### Completeness

```python
def check_completeness(df, required_columns):
    """Completeness check"""
    missing = df[required_columns].isnull().sum()
    return missing[missing > 0]
```

### Uniqueness

```python
def check_uniqueness(df, unique_columns):
    """Uniqueness check"""
    duplicates = df[unique_columns].duplicated().sum()
    return duplicates
```

### Validity

```python
def check_validity(df, rules):
    """Validity check"""
    violations = {}
    for column, rule in rules.items():
        violations[column] = ~df[column].apply(rule).sum()
    return violations
```

## Quality Dashboard

```python
# Data Quality metrics

def calculate_quality_score():
    return {
        'completeness': 0.98,
        'uniqueness': 0.95,
        'validity': 0.92,
        'consistency': 0.90,
        'overall': 0.94
    }
```

## Data Quality Monitoring

### Great Expectations

```python
import great_expectations as gx

# Create expectation suite
suite = gx.dataset.DatasetValidationExpectations()

# Add expectations
suite.expect_column_values_to_not_be_null("email")
suite.expect_column_values_to_be_unique("user_id")
suite.expect_column_value_lengths_to_be_between("name", 1, 100)
```

### DBT Tests

```yaml
# dbt/data_quality.yml

version: 2

models:
  - name: orders
    tests:
      - dbt_utils.expression_is_true:
          expression: "order_date >= created_at"
      - dbt_utils.recency:
          datepart: day
          interval: 1
```

## Data Quality Incidents

```python
# Alert on quality issues
def check_and_alert(df):
    violations = check_quality_rules(df)
    if violations:
        send_alert(
            title="Data Quality Issues",
            details=violations
        )
```

## Quality Criteria

- [ ] Profiling regular
- [ ] Quality rules documented
- [ ] Monitoring configured
- [ ] Alerts working
- [ ] Quality score tracked
- [ ] Issues resolved