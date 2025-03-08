#!/bin/bash

# Content to add to .zshrc
config="
# Set Java 21 as default for R
export JAVA_HOME=\$(/usr/libexec/java_home -v 21)
export PATH=\$JAVA_HOME/bin:\$PATH
"

# Append to each user's .zshrc
echo "$config" >> ~/.zshrc

# Create R environment settings
mkdir -p ~/.R
echo "JAVA_HOME=\$(/usr/libexec/java_home -v 21)" > ~/.Renviron
echo "JAVA_HOME=\$(/usr/libexec/java_home -v 21)" > ~/.R/Makevars

# Source the updated .zshrc
source ~/.zshrc

# Verify Java version
java -version