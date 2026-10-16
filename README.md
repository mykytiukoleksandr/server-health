# server-health

Small bash that analyzes your server.

##What it does

Collects data from your server and writes reports: Date and Hostname, Space on the disk, Memory,
Heaviest processes, Nginx status.

## Structure

- `scripts/report.sh` - report script
- `reports/` - generated output (not tracked by Git)

## How to run
```
./scripts/report.sh
cat reports/health.txt
```
