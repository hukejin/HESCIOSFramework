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

## 在pods下创建文件
1. HESCIOSFramework文件下创建对应的module文件夹
2. 在module文件夹里创建相应的功能文件*.h,*.m，添加相应的功能
3. 找到HESCIOSFramework.podspec里更新s.version版本号
4. 在文件的下部添加新的源码路径和文件，要不pod install 会报找不到文件的错误

## 操作步骤
1. 每次将更新内容，全部git push到远程地址
```
更新子文件目录，这样才能打包framework里
```
2. 在工程根目录 使用以下命令，将git的tag也和上述版本号同步
```
git tag '0.1.0'
git push --tags
```
3. 接下来先与检测下podspec，然后将代码推送到cocoapods里
```
pod spec lint HESCIOSFramework.podspec

pod trunk push HESCIOSFramework.podspec --verbose --allow-warnings --use-libraries
```
4. 如果提示成功，则可以进行pod install安装，如果提示找不到该库文件，需要更新下本地库资源
```
pod repo update
pod install
```
## 库内容例子使用说明
#### toastutil  无交互提示用语
| 功能 | 函数 |
| --- | --- |
| 1秒提示语 | toastInshorttime:(NSString *)title view:(UIView *)masterView |
| 2秒提示语 | toastInLongtime:(NSString *)title view:(UIView *)masterView |

#### colorutil  十六进制转RGB颜色，支持#FFFFFF和0xFFFFFF等 
| 功能 | 函数 |
| --- | --- |
| 字符串转UIColor  #FFFFFF | colorWithHexString |
| 十六进制转UIColor  0xFFFFFF | colorWithRGBHex |
#### datetimeutil  日期和时间戳之间的转换工具，具体请看代码注释 
| 功能 | 函数 |
| --- | --- |
| 标准时间转时间戳 | getTimeTemp |
| 时间戳转标准时间 | getTimeTemp2SystemTime |
#### viewctrlutil  获取当前view所在的viewcontroller
| 功能 | 函数 |
| --- | --- |
| 标准时间转获取当前view所在的viewcontroller戳 | getViewController |
#### imageutil  图片和base64编码互转
| 功能 | 函数 |
| --- | --- |
| base64转UIImage | (UIImage *)base64ToImg:(NSString *)string |
| UIImage转base64 | (NSString *)imgTobase64:(UIImage *)img |
####  httputil  web请求，包含了get/post/upload/download，回调均以block形式实现 
| 功能 | 函数 |
| --- | --- |
| get方法，支持自定义header | getRequest |  
| post表单形式，支持自定义header | postFormRequest |
| post-json数据形式，支持自定义header | postJSONRequest |
| 文件下载 | downLoadFile |
| upLoadFile 不支持断点续传 | upLoadFile |
#### animatorutil 基本的动画方法
| 功能 | 函数 |
| --- | --- |
| 旋转动画 | getRotatiionAnimator |  
| 缩放动画 | getScaleAnimator |
| 平移动画 | getTranslationAnimator |
#### photoalbumutil 操作相册
| 功能 | 函数 |
| --- | --- |
| 下载图片、视频到相册里 | downLoadMediaFromWeb |  
| 保存image到指定目录 | saveImageToAlbum |
| 检测文件是否存在 | isFileExistAtPath |
| 查询路径下的相关后缀名文件列表 | getFilenamelistOfType |  
| 图像转角度 | changImageRotation |
| 图片进行压缩 | compressImage |
| 图片缩放到对应尺寸 | imageByScalingToSize |  
| 判断当前image是jpg还是png格式 | NSPUIimagetypeFromNSdata |
| 根据后缀来选择文件 | filesByPath |



