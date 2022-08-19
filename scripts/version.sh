#!/bin/bash
cd $(dirname "$0")/.. && pwd;

version=$(awk -F '[= #]' '{a=1}a==1&&$1~/version:/{print $2;exit}' pubspec.yaml)

awk "{
        gsub(/public static final String SDK_VERSION =.*/, \"public static final String SDK_VERSION = \\\"$version\\\";\");
        print;
    }" android/src/main/java/cn/rongcloud/im/wrapper/flutter/RCIMWrapperVersion.java > .tmp && mv .tmp android/src/main/java/cn/rongcloud/im/wrapper/flutter/RCIMWrapperVersion.java


awk "{
        gsub(/static NSString \* const VER =.*/, \"static NSString \* const VER = @\\\"$version\\\";\");
        print;
    }" ios/Classes/RCIMWrapperPlugin.m > .tmp && mv .tmp ios/Classes/RCIMWrapperPlugin.m

