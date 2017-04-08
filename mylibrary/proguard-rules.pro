# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in G:\AndroidSdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile


# 0.关闭压缩
-dontshrink

# 1.不混淆model包下的所有类
-keep class com.yundoku.mylibrary.model.* {*;}

# 2.UserManager类不混淆
-keep class com.yundoku.mylibrary.manager.UserManager{*;}

# 3.不混淆ConnectionUtils类中的public方法
-keep class com.yundoku.mylibrary.util.ConnectionUtils{
    public <methods>;
}

# 4.类和public变量不混淆
-keep class com.yundoku.mylibrary.util.CommonUtils{
    public <fields>;
}

# 5.类和public构造器不混淆
-keep class com.yundoku.mylibrary.animal.Animal{
    public <init>();
    public <init>(java.lang.String);
}

# 6.类中的内部类不被混淆(内部类类名会混淆，变量和方法名不混淆)
-keepclassmembers class com.yundoku.mylibrary.manager.AnimalManager$AnimalInfo{*;}

# 7.类中的public方法不混淆，而类混淆
-keepclassmembers class com.yundoku.mylibrary.util.FileUtils{
    public <methods>;
}

# 8.类中的变量不混淆，而类混淆
-keepclassmembers class com.yundoku.mylibrary.util.HttpUtils{
    public <fields>;
}

# 9.保护子类不被混淆
-keep class * extends com.yundoku.mylibrary.animal.Animal{*;}

# 10.所有枚举和类中枚举不混淆
-keep enum * {*;}

# 11.所有native方法不被混淆（这里不能使用keep，如果使用keep,会导致其他类名不混淆，当然方法和变量都是混淆的）
-keepclasseswithmembernames  class *{# 或者使用 keepclassmembers
    native <methods>;
}