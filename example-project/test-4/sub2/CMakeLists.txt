cmake_minimum_required(VERSION 3.10.2)
project(sub2)


add_library(
	sub2 STATIC
	src/func.cpp
)

set_target_properties(
	sub2				PROPERTIES
	XCODE_ATTRIBUTE_SKIP_INSTALL	"YES"
)

target_link_libraries(sub2 "System/Library/Frameworks/UIKit.framework")
target_link_libraries(sub2 "System/Library/Frameworks/StoreKit.framework")
target_include_directories(sub2 PUBLIC inc)

