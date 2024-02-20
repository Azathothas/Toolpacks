
```bash
❯ !# Add a job
EDITOR="nano" crontab -e

❯ !# List All Cron-Jobs
crontab -l

❯ !# Test a cron job-syntax
cat << 'EOF' > "/tmp/test.cron"
##------------------------------##
#@IgnoreInspection BashAddShebang
SHELL=/usr/bin/bash
CRON_TZ=UTC
TZ=UTC
28 18 * * 0,2,5 'curl -qfsSL "https://pub.ajam.dev/repos/Azathothas/Toolpacks/.github/runners/cron/gh-runner-arm64x-gcp.sh" -o /tmp/gh-runner-arm64x-gcp.sh'
29 18 * * 0,2,5 'dos2unix --quiet /tmp/gh-runner-arm64x-gcp.sh 2>/dev/null'
30 18 * * 0,2,5 /bin/bash /tmp/gh-runner-arm64x-gcp.sh > /tmp/gh-runner-arm64x-gcp.log 2>&1
##------------------------------##
EOF
crontab -n "/tmp/test.cron"
```
