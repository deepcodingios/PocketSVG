#!/bin/sh

    set -e

    rm -rf archives Demo-iOS.xcframework

    xcodebuild archive \
      -scheme Demo-iOS \
      -destination "generic/platform=iOS" \
      -archivePath ./archives/ios_devices.xcarchive \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    xcodebuild archive \
      -scheme Demo-iOS \
      -destination "generic/platform=iOS Simulator" \
      -archivePath ./archives/ios_simulator.xcarchive \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    xcodebuild -create-xcframework \
      -framework ./archives/ios_devices.xcarchive/Products/Library/Frameworks/Demo-iOS.framework \
      -framework ./archives/ios_simulator.xcarchive/Products/Library/Frameworks/Demo-iOS.framework \
      -output ./Demo-iOS.xcframework

    echo "Created Demo-iOS.xcframework 🎉"
