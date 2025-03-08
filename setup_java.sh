#!/bin/bash

# Get the exact path to JDK 21 from Homebrew
JDK21_PATH=$(brew --prefix openjdk@21)
echo "JDK 21 is installed at: $JDK21_PATH"

# Update .zshrc
echo "Updating .zshrc..."
# Remove previous Java settings
sed -i '.bak' '/JAVA_HOME/d' ~/.zshrc
sed -i '.bak' '/# Set Java 21/d' ~/.zshrc

# Add new Java settings
echo "
# Set Java 21 as default for R
export JAVA_HOME=\"$JDK21_PATH/libexec/openjdk.jdk/Contents/Home\"
export PATH=\"\$JAVA_HOME/bin:\$PATH\"
" >> ~/.zshrc

# Set up R Java configuration
echo "Setting up R Java configuration..."
mkdir -p ~/.R

# Create R Makevars file
echo "# R Makevars for Java configuration
JAVA_HOME=$JDK21_PATH/libexec/openjdk.jdk/Contents/Home
" > ~/.R/Makevars

# Create .Renviron file
echo "JAVA_HOME=$JDK21_PATH/libexec/openjdk.jdk/Contents/Home" > ~/.Renviron

# Create symbolic links that R might look for
sudo ln -sf "$JDK21_PATH/libexec/openjdk.jdk/Contents/Home" /Library/Java/JavaVirtualMachines/openjdk-21.jdk
sudo R CMD javareconf JAVA_HOME=$JDK21_PATH/libexec/openjdk.jdk/Contents/Home

echo "Setup complete. Please restart your terminal, then reinstall rJava with:"
echo "R CMD INSTALL --configure-args='-with-java-home=$JDK21_PATH/libexec/openjdk.jdk/Contents/Home' rJava"