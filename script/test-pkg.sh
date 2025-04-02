#!/bin/bash

set -ex

# First build Catui.framework
xcodebuild

# Now create xcframework
xcodebuild -create-xcframework \
	-framework build/Release/Catui.framework \
	-output Catui.xcframework

# Now test basic Swift package referencing above
cd testpkg
swift run
