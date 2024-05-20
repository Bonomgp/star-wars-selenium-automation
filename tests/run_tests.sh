#!/usr/bin/env bash

echo "Starting Star Wars automation run..."

# Start execution of tests:
robot --name 'Google Chrome run' -d results/ -o run1_chrome.xml --variable browser:chrome tests/
robot --name 'Firefox run' -d results/ -o run2_firefox.xml --variable browser:firefox tests/
robot --name 'Microsoft Edge run' -d results/ -o run3_edge.xml --variable browser:edge tests/

echo "Automation run completed. Reports are available in the results directory."

exit 0
