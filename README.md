# server-health

Small bash script that collects basic health info about a Linux server and saves it to a text report.

## What it does

Writes `reports/health.txt` with five sections:

1. Date and hostname
2. Disk space on `/`
3. Memory usage
4. Top 5 processes by memory
5. Nginx status (`active` / `inactive`)

## Structure

- `scripts/health.sh` - report script
- `reports/` - generated output (not tracked by Git, see `.gitignore`)

## Requirements

- Linux with bash and systemd (tested on Ubuntu in WSL2)
- nginx is optional: if it is not installed or not running, the report shows `inactive`

## How to run

```bash
git clone https://github.com/mykytiukoleksandr/server-health.git
cd server-health
./scripts/health.sh
cat reports/health.txt
```

The script can be started from any folder: it changes to the project root by itself.

## Example output

```text
=== 1. Date and Hostname ===
Fri Oct 16 14:00:50 UTC 2026
DESKTOP-9IL9VEK

=== 2. Space on the disk ===
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdd       1007G  1.6G  955G   1% /

=== 3. Memory ===
               total        used        free      shared  buff/cache   available
Mem:           7.4Gi       563Mi       6.3Gi       4.1Mi       644Mi       6.8Gi
Swap:          2.0Gi          0B       2.0Gi

=== 4. Heaviest processes ===
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         282  0.0  0.4 123476 32692 ?        Ssl  12:33   0:00 /usr/bin/python3 ... (shortened)
root         157  0.0  0.3  44112 29840 ?        Ss   12:33   0:00 /usr/bin/python3 ... (shortened)
...

=== 5. Nginx status ===
active
```

## What I learned

Redirection (`>` and `>>`), pipes, `df`, `free`, `ps`, `systemctl`, file permissions (`chmod +x`) and working with Git and GitHub.
