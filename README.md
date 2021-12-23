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
- toastInshorttime:(NSString *)title view:(UIView *)masterView  1秒提示语
- toastInLongtime:(NSString *)title view:(UIView *)masterView  2秒提示语
| 函数 | 功能 |
| --- | --- |
| toastInshorttime:(NSString *)title view:(UIView *)masterView | 1秒提示语 |
| toastInLongtime:(NSString *)title view:(UIView *)masterView | 2秒提示语 |
#### colorutil  十六进制转RGB颜色，支持#FFFFFF和0xFFFFFF等
- colorWithHexString 字符串转UIColor  #FFFFFF
- colorWithRGBHex  十六进制转UIColor  0xFFFFFF
#### datetimeutil  日期和时间戳之间的转换
- getTimeTemp 标准时间转时间戳
- getTimeTemp2SystemTime  时间戳转标准时间
#### viewctrlutil  获取当前view所在的viewcontroller
- getViewController:(UIView *)view  
#### imageutil  图片和base64编码互转
-  (UIImage *)base64ToImg:(NSString *)string
-  (NSString *)imgTobase64:(UIImage *)img
####  httputil  web请求，包含了get/post/upload/download，回调均以block形式实现
- getRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock  get方法，支持自定义header
- postFormRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock  post表单形式，支持自定义header
- postJSONRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock post-json数据形式，支持自定义header
- downLoadFile:(NSString *)fileUrl headers:(nullable NSDictionary*)headers response:(DownloadResponseBlock) responseBlock 文件下载
- upLoadFile:(NSString *)fileUrl filepaths:(NSArray *)files headers:(nullable NSDictionary*)headers response:(UploadResponseBlock) responseBlock 文件上传
#### animatorutil 基本的动画方法
- getRotatiionAnimator:(float)duration repeatcount:(float) repeatcount startangle:(float)fromangle endangle:(float)toangle  direct:(Direction)direct; 选择动画
- getScaleAnimator:(float)scale duration:(float)duration;  缩放动画
- getTranslationAnimator:(CGPoint)from toPoint:(CGPoint)toPoint duration:(float)duration; 平移动画
#### photoalbumutil 操作相册
- downLoadMediaFromWeb:(NSString*)fileUrl error:(SaveResultBlock) errorBlock; 下载图片、视频到相册里
- saveImageToAlbum:(NSString*)filePath fileName:(NSString*)fileName image:(UIImage*)image; 保存image到指定目录
- isFileExistAtPath:(NSString*)fileFullPath; 检测文件是否存在
- getFilenamelistOfType:(NSString *)type fromDirPath:(NSString *)dirPath; 查询路径下的相关后缀名文件列表
- changImageRotation:(UIImage *)image rotation:(UIImageOrientation)orientation; 图像转角度
- compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize; 图片进行压缩
- imageByScalingToSize:(CGSize)targetSize :(UIImage *)image; 图片缩放到对应尺寸
- NSPUIimagetypeFromNSdata:(NSData*) imagedata; 判断当前image是jpg还是png格式
- filesByPath:(NSString *)path suffix:(nullable NSString*)suffix; 根据后缀来选择文件



