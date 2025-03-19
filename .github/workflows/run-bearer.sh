#!/bin/bash
# Check for Python or Go files before running the scan
if ! find . -name "*.py" -o -name "*.go" | grep -q .; then
  echo "No Python or Go files found. Skipping SAST scan."
  echo "EXIT_CODE=0" >> $GITHUB_ENV
  echo "REPORT_FILE=/dev/null" >> $GITHUB_ENV
  exit 0
fi

# Install Bearer CLI and run the scan
curl -sfL https://raw.githubusercontent.com/Bearer/bearer/main/contrib/install.sh | sh
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
REPORT_FILE=./bearer-report-$TIMESTAMP.html
./bin/bearer scan . --skip-path vendor --format html --output $REPORT_FILE --fail-on-severity critical,high --severity critical,high,medium,low
EXIT_CODE=$?
echo "EXIT_CODE=$EXIT_CODE" >> $GITHUB_ENV
echo "REPORT_FILE=$REPORT_FILE" >> $GITHUB_ENV
