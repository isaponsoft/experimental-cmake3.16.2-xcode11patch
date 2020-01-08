mkdir build
cd build
rm -fr *
cmake -G Xcode ../project

xcodebuild \
	-allowProvisioningUpdates \
	-project			example.xcodeproj \
	-sdk				iphoneos \
	-scheme				appmain \
	-archivePath		appmain.xcarchive \
	archive \

cd ..

