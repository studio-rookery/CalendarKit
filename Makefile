generate-xcodeproj:
	swift package generate-xcodeproj --xcconfig-overrides Configs/Config.xcconfig

test:
	swift test -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.12"