//
//  HttpUtil.h
//  hybridedemo
//
//  Created by pubinfo on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface HttpUtil : NSObject

typedef void(^ResponseBlock)(NSURLResponse * response,id responseObj, NSError * error);

typedef void(^DownloadResponseBlock)( NSURLResponse * _Nullable  response,id _Nullable filePath, NSError * _Nullable error,NSProgress * _Nullable progress);

typedef void(^UploadResponseBlock)( NSURLResponse * _Nullable  response,id _Nullable responseobj, NSError * _Nullable error,NSProgress * _Nullable progress);

/**
 web  get请求
 
 url 请求地址
 
 params   key-value形式的参数对
 
 responseBlock web回调(response:http报文, responseObj:web端的responsebody，error: 发生调用错误)
 */
-(void) getRequest:(NSString*) url params:(NSDictionary*) params response:(ResponseBlock) responseBlock;

/**
 web  get请求
 
 url 请求地址
 
 params   key-value形式的参数对
 
 headers  设置http的header
 
 responseBlock web回调(response:http报文, responseObj:web端的responsebody，error: 发生调用错误)
 */
-(void) getRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock;

/**
 web post表单提交
 
 * url 请求地址
 
 * params   key-value形式的参数对
 
 * responseBlock web回调(response:http报文, responseObj:web端的responsebody，error: 发生调用错误)
 */
-(void) postFormRequest:(NSString*) url params:(NSDictionary*) params response:(ResponseBlock) responseBlock;

/**
 web post表单提交
 
 * url 请求地址
 
 * params   key-value形式的参数对
 
 * headers  设置http的header
 
 * responseBlock web回调(response:http报文, responseObj:web端的responsebody，error: 发生调用错误)
 */
-(void) postFormRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock;

/**
 web post json对象请求
 
 * url 请求地址
 
 * params   key-value形式的参数对
 
 * responseBlock web回调(response:http报文, responseObj:web端的responsebody，error: 发生调用错误)
 */
-(void) postJSONRequest:(NSString*) url params:(NSDictionary*) params response:(ResponseBlock) responseBlock;

/**
 web post json对象请求
 
 * url 请求地址
 
 * params   key-value形式的参数对
 
 * headers  设置http的header
 
 * responseBlock web回调(response:http报文, responseObj:web端的responsebody，error: 发生调用错误)
 */
-(void) postJSONRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock;
/**
 下载文件
 
 * fileUrl 文件地址
 
 * responseBlock web回调(response:http报文, filePath:下载后的缓存地址，error: 发生调用错误，progress:文件下载进度)
 */
-(void) downLoadFile:(NSString *)fileUrl response:(DownloadResponseBlock) responseBlock;
/**
 下载文件
 
 * fileUrl 文件地址
 
 * headers  设置http的header
 
 * responseBlock web回调(response:http报文, filePath:下载后的缓存地址，error: 发生调用错误，progress:文件下载进度)
 */
-(void) downLoadFile:(NSString *)fileUrl headers:(nullable NSDictionary*)headers response:(DownloadResponseBlock) responseBlock;

/**
 上传文件
 
 * fileUrl 文件服务器地址
 
 * filepaths 要上传的文件数组
 
 * responseBlock web回调(response:http报文, responseobj:上传后返回值，error: 发生调用错误，progress:文件上传进度)
 */
-(void) upLoadFile:(NSString *)fileUrl filepaths:(NSArray *)files response:(UploadResponseBlock) responseBlock;
/**
 下载文件
 
 * fileUrl 文件地址
 
 * filepaths 要上传的文件数组
 
 * headers  设置http的header
 
 * responseBlock web回调(response:http报文, responseobj:上传后返回值，error: 发生调用错误，progress:文件上传进度)
 */
-(void) upLoadFile:(NSString *)fileUrl filepaths:(NSArray *)files headers:(nullable NSDictionary*)headers response:(UploadResponseBlock) responseBlock;

@end

NS_ASSUME_NONNULL_END
