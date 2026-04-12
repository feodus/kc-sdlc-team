---
name: monitoring-setup
description: Monitoring and logging setup. Use for setting up observability - metrics, logs, traces, and alerts.
---

# Monitoring Setup

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for setting up comprehensive monitoring and observability. Includes metrics, logging, tracing, dashboards, and alerting.

## When to Use

Use this skill:
- When setting up monitoring from scratch
- For configuring observability
- When creating dashboards
- For setting up alerts
- When integrating with Prometheus/Grafana
- For setting up centralized logging

## Prometheus + Grafana

### Prometheus config

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

alerting:
  alertmanagers:
    - static_configs:
        - targets:
          - alertmanager:9093

rule_files:
  - "alerts/*.yml"

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'myapp'
    static_configs:
      - targets: ['myapp:3000']
    metrics_path: '/metrics'
```

### Grafana Dashboard

```json
{
  "dashboard": {
    "title": "Application Overview",
    "panels": [
      {
        "title": "Requests per second",
        "targets": [
          {
            "expr": "sum(rate(http_requests_total[5m])) by (method)"
          }
        ],
        "type": "graph"
      },
      {
        "title": "Response time (p95)",
        "targets": [
          {
            "expr": "histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))"
          }
        ],
        "type": "graph"
      }
    ]
  }
}
```

### Metrics in the application

```python
from prometheus_client import Counter, Histogram, start_http_server

REQUEST_COUNT = Counter('http_requests_total', 'Total HTTP requests',
                   ['method', 'endpoint', 'status'])
REQUEST_DURATION = Histogram('http_request_duration_seconds',
                        'HTTP request duration',
                        ['method', 'endpoint'])

@app.route('/api/data')
def get_data():
    with REQUEST_DURATION.labels(method='GET', endpoint='/api/data').time():
        REQUEST_COUNT.labels(method='GET', endpoint='/api/data', status=200).inc()
```

## Alerting Rules

```yaml
groups:
- name: myapp
  rules:
  - alert: HighErrorRate
    expr: |
      sum(rate(http_requests_total{status=~"5.."}[5m])) /
      sum(rate(http_requests_total[5m])) > 0.05
    for: 5m
    labels:
      severity: critical
    annotations:
      summary: High error rate detected

  - alert: HighLatency
    expr: |
      histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[5m])) by (le)) > 1
    for: 5m
    labels:
      severity: warning
```

## Alert Notification

### AlertManager config

```yaml
global:
  resolve_timeout: 5m

route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 10s
  repeat_interval: 12h
  receiver: 'team-alerts'
  
receivers:
- name: 'team-alerts'
  email_configs:
  - to: 'team@example.com'
    send_resolved: true
  
  slack_configs:
  - api_url: 'https://hooks.slack.com/services/XXX'
    channel: '#alerts'
    send_resolved: true
```

## SLO/SLI Dashboard

```yaml
# Key metrics for dashboard
- Availability (SLO): 
  sum(rate(http_requests_total{status=~"2.."}[5m])) / 
  sum(rate(http_request_total[5m]))
  
- Latency (SLO):
  histogram_quantile(0.99, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))
```

## Quality Criteria

- [ ] Metrics collection configured
- [ ] Dashboards created
- [ ] Alerts configured
- [ ] Logging centralized
- [ ] Alerts notifications working
- [ ] Runbook for each alert
- [ ] On-call rotation configured
- [ ] SLOs defined
