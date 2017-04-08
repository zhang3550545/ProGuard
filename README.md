## ProGuard学习实践

当前ProGuard测试的类均是没有调用的。所以在混淆时，关闭压缩（-dontshrink）。

#### 0.关闭压缩
```
-dontshrink
```

#### 1.不混淆model包下的所有类
```
-keep class com.yundoku.mylibrary.model.* {*;}
```
#### 2.UserManager类不混淆
```
-keep class com.yundoku.mylibrary.manager.UserManager{*;}
```

#### 3.不混淆ConnectionUtils类中的public方法
```
-keep class com.yundoku.mylibrary.util.ConnectionUtils{
    public <methods>;
}
```

#### 4.类和public变量不混淆
```
-keep class com.yundoku.mylibrary.util.CommonUtils{
    public <fields>;
}
```

#### 5.类和public构造器不混淆
```
-keep class com.yundoku.mylibrary.animal.Animal{
    public <init>();
    public <init>(java.lang.String);
}
```


#### 6.类中的内部类不被混淆(内部类类名会混淆，变量和方法名不混淆)
```
-keepclassmembers class com.yundoku.mylibrary.manager.AnimalManager$AnimalInfo{*;}
```


#### 7.类中的public方法不混淆，而类混淆
```
-keepclassmembers class com.yundoku.mylibrary.util.FileUtils{
    public <methods>;
}
```


#### 8.类中的变量不混淆，而类混淆
```
-keepclassmembers class com.yundoku.mylibrary.util.HttpUtils{
    public <fields>;
}
```


#### 9.保护子类不被混淆
```
-keep class * extends com.yundoku.mylibrary.animal.Animal{*;}
```


#### 10.所有枚举和类中枚举不混淆(类中的枚举不混淆，会导致当前类名不混淆，当然方法和变量会混淆)
```
-keep enum * {*;}
```

#### 11.所有native方法不被混淆（这里不能使用keep，如果使用keep,会导致其他类名不混淆，当然方法和变量都是混淆的）
```
-keepclasseswithmembernames  class *{# 或者使用 keepclassmembers
    native <methods>;
}
```


#### 12.jar,arr,app的混淆问题

jar生成出来，默认就混淆了（是当前lib工程文件混淆）。

生成release的aar文件会混淆当前lib工程的所有文件（包括jar文件）
，如果arr生成时，混淆文件中没有keep，jar中的内容，会把jar中的内容再混淆一次。

app项目打出来的release.apk文件会混淆当前app下的所有文件（包括jar和arr文件）。
，如果release.apk生成时，混淆文件中没有keep，jar和aar中的内容，会把jar和aar中的内容再混淆一次。



##### **当前的项目引用关系：**
mylibrary项目生成jar文件--->userlib项目使用jar，生成aar包--->app项目使用userlib-release.aar
    
这样我们可以通过对比 
**mylibrary.jar** ，**userlib-release.aar**和**app-release.apk**
3个文件，可以知道3者的混淆是怎么回事了。

**注意**：native只在mylibrary.jar混淆一次，在userlib-release.aar和app-release.apk中都不会混淆了，详情请看每个NativeUtils