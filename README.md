# cmake for xcode11 patch

for cmake version 3.16.2

## Original version have a problem

xcode11 (before?) SYMROOT seems to be disabled, and when creating an xcode project for ios with cmake and doing an Archive build, the library added with add_subdirectory () cannot be linked and the build does not pass well I fell.
## Cause


When linking the static library of the subproject added by add_subdirectory (), the library is specified by OTHER_LDFLAGS, but this is an absolute path. This does not cause a problem when performing a normal build, but when performing an Archive build, since xcodebuild works under DerivedData, the absolute library generated by cmake does not exist, so the static library was not found at link time and an error occurred It becomes.
## Solution

Specifying a static library in "Link Binary With Libraries" of Build Phases seems to be the correct way in the current xcode specification.

Therefore, cmcmXCodeGenerator of cmake is slightly modified to link with "Link Binary With Libraries", that is, Framework instead of OTHER_LDFLAGS.

By doing this, Aechive will be passed with the initial value of xcode without generating INSTALL_PATH and SYMROOT.

## Feedback to cmake official

We don't claim any rights to the patch, so if it looks okay please give feedback on my behalf.

