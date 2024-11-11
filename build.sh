#!/bin/bash

# Download Flutter
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Install Flutter dependencies
flutter doctor
flutter clean
flutter pub get

# Build
flutter build web --release 