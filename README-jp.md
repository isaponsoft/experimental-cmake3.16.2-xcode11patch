# cmake for xcode11 patch

for cmake version 3.16.2

## Original version have a problem

xcode11(もっと前から？)SYMROOTが無効になったらしく、cmakeでios向けのxcodeプロジェクトを生成してArchiveビルドしたときに、add_subdirectory() で追加したライブラリがリンクできずビルドがうまく通らないという状況に陥りました。

## Cause

add_subdirectory() で追加したサブプロジェクトのstatic libraryをリンクするとき、OTHER_LDFLAGSでライブラリを指定しているのですが、これが絶対パスになっています。通常ビルドをする時がこれで問題は起こらないのですが、ArchiveビルドするときはxcodebuildがDerivedData以下で作業をするため、cmakeが生成した絶対パスが存在しないため、リンク時にstatic libraryが見つからずエラーになります。

## Solution

Build Phases の "Link Binary With Libraries" でstatic libraryを指定するのが現状のxcodeの仕様において正しいやり方のようです。

そこで、cmakeのcmGlobalXCodeGeneratorを少し細工してOTHER_LDFLAGSではなく、"Link Binary With Libraries"、すなわちFrameworkでリンクするようにします。

こうすることで、INSTALL_PATHとSYMROOTは生成せずにxcodeの初期値でAechiveが通るようになります。