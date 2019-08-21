#!/bin/bash

set -o errexit -o nounset

# Update platform
echo "Updating platform..."

# Install p7zip for packaging archive for deployment
sudo -E apt-get -yq --no-install-suggests --no-install-recommends --force-yes install p7zip-full

# Need to install chrpath to set up proper rpaths. This is necessary
# to allow Qt libraries to be visible to each other. Alternatively,
# you could use qt.conf, which wouldn't require chrpath.
sudo -E apt-get -yq --no-install-suggests --no-install-recommends --force-yes install chrpath

# Hold on to current directory
project_dir=$(pwd)

# Define your Qt install path for later use
qt_install_dir=/opt

# Install Qt
echo "Installing Qt..."
cd ${qt_install_dir}
echo "Downloading Qt files..."
sudo wget https://github.com/adolby/qt-more-builds/releases/download/5.7/qt-opensource-5.7.0-linux-x86_64.7z
echo "Extracting Qt files..."
sudo 7z x qt-opensource-5.7.0-linux-x86_64.7z &> /dev/null

# Install Qt Installer Framework
echo "Installing Qt Installer Framework..."
sudo wget https://github.com/adolby/qt-more-builds/releases/download/qt-ifw-2.0.3/qt-installer-framework-opensource-2.0.3-linux.7z
sudo 7z x qt-installer-framework-opensource-2.0.3-linux.7z &> /dev/null

# Add Qt binaries to path
echo "Adding Qt binaries to path..."
PATH="${qt_install_dir}/Qt/5.7/gcc_64/bin/:${qt_install_dir}/Qt/QtIFW2.0.3/bin/:${PATH}"

# Build YourApp
echo "Building YourApp..."
cd "${project_dir}"
