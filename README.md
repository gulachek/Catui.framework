# Catui.framework

Objective C Wrapper of catui

This is intended to make it easier to use the
[catui](https://github.com/gulachek/catui) library from Swift.
The approach is to wrap that C library in an Objective C
framework, [create a binary
xcframework](https://developer.apple.com/documentation/xcode/creating-a-multi-platform-binary-framework-bundle),
and have swift packages reference it using the `binaryTarget` as
described in [this
article](https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages).
