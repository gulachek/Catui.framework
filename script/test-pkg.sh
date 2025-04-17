#!/bin/bash

set -ex

# First build Catui.framework
xcodebuild

# Now create xcframework
if [ -e Catui.xcframework ]; then
	rm -rf Catui.xcframework
fi

xcodebuild -create-xcframework \
	-framework build/Release/Catui.framework \
	-output Catui.xcframework

# Make sure we've included licenses
for RES in Catui.xcframework/*/Catui.framework/RESOURCES; do
	test -f "$RES/LICENSE"
	DEP="$RES/DEPENDENCY-LICENSES"
	test -f "$DEP/catui.txt"
	test -f "$DEP/msgstream.txt"
	test -f "$DEP/unixsocket.txt"
	test -f "$DEP/cJSON.txt"
done

# Now test basic Swift package referencing above
cd testpkg
swift run
