
#let Time(doc)={}
=
#Time[2025-05-01T18:42:42.679+08:00_W18-4]
斯項目有二分支。mainˋ用skiasharp、helloworldˋ唯簡單ʹ例芝導出函數。

helloworldˉ分支ˋ缺`libdotnet.targets`、故直ᵈ按其說明㕥編譯則敗。

試編譯ʹ法:

進WSL

裝.net 9, android ndk與sdk clang(?)

安卓SDK與NDK路徑ˋ似
```bash
export ANDROID_HOME="/mnt/d/ENV/_wsl/tools_r25.2.3-linux"
export ANDROID_NDK_HOME="/mnt/d/ENV/_wsl/android-ndk-r27c"
```


在`libdotnet.targets`中 諸`<_NdkPrebuiltAbi>`條目中加一個
```xml
<_NdkPrebuiltAbi>linux-x86_64</_NdkPrebuiltAbi>
```
否則報錯、曰尋路經旹缺此。察其報錯ʸ試尋ʹ路經、中有 `.../xxx//xxx/...`等。加此後則潙`.../xxx/linux-x86_64/xxx/...`則路徑対矣。


珩命令
```bash
export ANDROID_HOME="/mnt/d/ENV/_wsl/tools_r25.2.3-linux"
export ANDROID_NDK_HOME="/mnt/d/ENV/_wsl/android-ndk-r27c"
dotnet build
dotnet publish DotNet/libdotnet.csproj
```

然後可得.so庫。

== 關鍵配置:
+ libdotnet.csproj中:
	```xml
	<Project>
		<PropertyGroup>
			<PublishAotUsingRuntimePack>true</PublishAotUsingRuntimePack>
		</PropertyGroup>
		<Import Project="libdotnet.targets" />
	</Project>
	```
+ 及`libdotnet.targets`自身。

餘者 如`<LinkerArg Include="-Wl,-soname,libdotnet.so" />`, skiasharp相關者, 編譯體積裁減選項等 非必要。 可視情而刪