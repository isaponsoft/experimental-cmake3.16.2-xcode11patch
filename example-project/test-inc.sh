PRJ=${1}


mkdir build-${PRJ}
rm -fr build-${PRJ}/*
cd build-${PRJ}

cmake -G Xcode ../${PRJ} \
\
&& xcodebuild \
	-allowProvisioningUpdates \
	-project			example.xcodeproj \
	-sdk				iphoneos \
	-scheme				appmain \
	build \
\
&& xcodebuild \
	-allowProvisioningUpdates \
	-project			example.xcodeproj \
	-sdk				iphoneos \
	-scheme				appmain \
	-archivePath		appmain.xcarchive \
	archive \
\
&& xcodebuild \
	-exportArchive \
	-archivePath appmain.xcarchive \
	-exportPath appmain.export \
	-exportOptionsPlist ../adhoc.plist

cd ..

