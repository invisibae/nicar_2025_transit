#!/bin/bash

# Get the exact path to JDK 21 from Homebrew
JDK21_PATH=$(brew --prefix openjdk@21)

# Content to add to .zshrc - Force use of specific path
config="
# Set Java 21 as default for R
export JAVA_HOME=\"$JDK21_PATH\"
export PATH=\"\$JAVA_HOME/bin:\$PATH\"
alias java=\"\$JAVA_HOME/bin/java\"
alias javac=\"\$JAVA_HOME/bin/javac\"
"

# Ensure we're starting fresh - remove previous JAVA_HOME settings
sed -i '.bak' '/JAVA_HOME/d' ~/.zshrc
sed -i '.bak' '/# Set Java 21/d' ~/.zshrc

# Append to .zshrc
echo "$config" >> ~/.zshrc

# Create R environment settings
mkdir -p ~/.R
echo "JAVA_HOME=\"$JDK21_PATH\"" > ~/.Renviron
echo "JAVA_HOME=\"$JDK21_PATH\"" > ~/.R/Makevars

# Print status
echo "Added Java 21 config to .zshrc"
echo "Created R environment files"
echo "Please restart your terminal or run: source ~/.zshrc"