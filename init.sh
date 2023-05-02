#!/usr/bin/env bash

# http://ronaldbradford.com/blog/scripting-standards/

source ./console_logger.sh

# Create folders
if [ ! -d "archives" ]; then
  mkdir archives
fi

if [ ! -d "out" ]; then
  mkdir out
fi

# Download JMeter
info "Downloading JMeter 5.5 ..."
if curl -0 https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.5.zip --output ./archives/jmeter.zip; then
  unzip ./archives/jmeter.zip -d .
  success "JMeter download complete to ./apache-jmeter-5.5"
else
  fatal "Error downloading JMeter"
  exit $?
fi
# END
