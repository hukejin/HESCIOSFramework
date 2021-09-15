# HESCIOSFramework

[![CI Status](https://img.shields.io/travis/napolun007@gmail.com/HESCIOSFramework.svg?style=flat)](https://travis-ci.org/napolun007@gmail.com/HESCIOSFramework)
[![Version](https://img.shields.io/cocoapods/v/HESCIOSFramework.svg?style=flat)](https://cocoapods.org/pods/HESCIOSFramework)
[![License](https://img.shields.io/cocoapods/l/HESCIOSFramework.svg?style=flat)](https://cocoapods.org/pods/HESCIOSFramework)
[![Platform](https://img.shields.io/cocoapods/p/HESCIOSFramework.svg?style=flat)](https://cocoapods.org/pods/HESCIOSFramework)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HESCIOSFramework is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HESCIOSFramework'
```

## Author

napolun007@gmail.com, liujunlin@jrfreestyle.cn

## License

HESCIOSFramework is available under the MIT license. See the LICENSE file for more info.

## 操作步骤
1. 每次将更新内容，全部git push到远程地址，并更新HESCIOSFramework.podspec里version版本号
2. 在工程根目录 使用以下命令，将git的tag也和上诉版本号同步
```
git tag '0.1.0'
git push --tags
```
3. 接下来将代码推送到cocoapods里
```
pod trunk push HESCIOSFramework.podspec --allow-warnings
```
4. 如果提示成功，则可以进行pod install安装，如果提示找不到该库文件，需要更新下本地库资源
```
pod repo update
pod install
```
## 库内容例子使用说明
-  toastutil  无交互提示用语
    - toastInshorttime:(NSString *)title view:(UIView *)masterView  1秒提示语
    - toastInLongtime:(NSString *)title view:(UIView *)masterView  2秒提示语
-  colorutil  十六进制转RGB颜色


