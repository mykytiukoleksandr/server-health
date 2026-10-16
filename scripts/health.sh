#!/bin/bash
cd "$(dirname "$0")/.."
mkdir -p reports

echo "=== 1. Date and Hostname ===" > reports/health.txt
date >> reports/health.txt
hostname >> reports/health.txt

echo "" >> reports/health.txt
echo "=== 2. Space on the disk ===" >> reports/health.txt
df -h / >> reports/health.txt

echo "" >> reports/health.txt
echo "=== 3. Memory ===" >> reports/health.txt
free -h >> reports/health.txt

echo "" >> reports/health.txt
echo "=== 4. Heaviest processes ===" >> reports/health.txt
ps aux --sort=-%mem | head -n 6 >> reports/health.txt

echo "" >> reports/health.txt
echo "=== 5. Nginx status ===" >> reports/health.txt
systemctl is-active nginx >> reports/health.txt
