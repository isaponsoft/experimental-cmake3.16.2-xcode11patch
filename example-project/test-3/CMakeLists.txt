cmake_minimum_required(VERSION 3.10.2)
project(example)

set(CMAKE_CXX_STANDARD 17)


add_executable(
	appmain MACOSX_BUNDLE
	src/main.cpp
)

set(CMAKE_CXX_FLAGS									"$(OTHER_CFLAGS) ${CMAKE_CXX_FLAGS} -x objective-c++")
set(CMAKE_OSX_SYSROOT								"iphoneos")
set(CMAKE_OSX_DEPLOYMENT_TARGET						"11.0" CACHE STRING "" FORCE)
set(CMAKE_XCODE_ATTRIBUTE_ENABLE_BITCODE			"NO" CACHE INTERNAL "")

set(CMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM			$ENV{XCODE_TEST_TEAM})

set_target_properties(
	appmain				PROPERTIES
	OUTPUT_NAME			appmain
	MACOSX_BUNDLE_GUI_IDENTIFIER						$ENV{XCODE_TEST_BUNDLEID}
	MACOSX_BUNDLE_LONG_VERSION_STRING					"1"
	MACOSX_BUNDLE_SHORT_VERSION_STRING					"1"
	MACOSX_BUNDLE_BUNDLE_VERSION						1
	XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME	"AppIcon"
)


target_link_libraries(appmain System/Library/Frameworks/UIKit.framework)


target_link_libraries(appmain)
