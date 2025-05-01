export ANDROID_HOME="/mnt/d/ENV/_wsl/tools_r25.2.3-linux"
export ANDROID_NDK_HOME="/mnt/d/ENV/_wsl/android-ndk-r27c"
dotnet build
dotnet publish DotNet/libdotnet.csproj
cd Native && ./gradlew assembleRelease