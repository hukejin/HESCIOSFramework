//
//  HttpUtil.m
//  hybridedemo
//
//  Created by pubinfo on 2021/5/19.
//

#import "HttpUtil.h"

@implementation HttpUtil

-(void) getRequest:(NSString*) url params:(NSDictionary*) params response:(ResponseBlock) responseBlock{    
    [self getRequest:url params:params headers:nil response:responseBlock];
}

-(void) getRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock{
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:params error:nil];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    if(headers != nil){
        configuration.HTTPAdditionalHeaders = headers;
    }
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        responseBlock(response,responseObject,error);
        
    }];

    
    [dataTask resume];
}

-(void) postFormRequest:(NSString*) url params:(NSDictionary*) params response:(ResponseBlock) responseBlock{
    [self postFormRequest:url params:params headers:nil response:responseBlock];
}

-(void) postFormRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock{
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:params error:nil];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    if(headers != nil){
        configuration.HTTPAdditionalHeaders = headers;
    }
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        responseBlock(response,responseObject,error);
    }];

    
    [dataTask resume];
}

-(void) postJSONRequest:(NSString*) url params:(NSDictionary*) params response:(ResponseBlock) responseBlock{
    [self postJSONRequest:url params:params headers:nil response:responseBlock];
}

-(void) postJSONRequest:(NSString*) url params:(NSDictionary*) params headers:(nullable NSDictionary*)headers response:(ResponseBlock) responseBlock{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    if(headers != nil){
        configuration.HTTPAdditionalHeaders = headers;
    }
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:params error:nil];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        responseBlock(response,responseObject,error);
    }];

    
    [dataTask resume];
}

-(void) downLoadFile:(NSString *)fileUrl response:(DownloadResponseBlock) responseBlock{
    [self downLoadFile:fileUrl headers:nil response:responseBlock];
}

-(void) downLoadFile:(NSString *)fileUrl headers:(nullable NSDictionary*)headers response:(DownloadResponseBlock) responseBlock{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    if(headers != nil){
        configuration.HTTPAdditionalHeaders = headers;
    }
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *url = [NSURL URLWithString:fileUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        responseBlock(nil,nil,nil,downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        responseBlock(response,filePath,error,nil);
    }];
    
    [downloadTask resume];
}

-(void) upLoadFile:(NSString *)fileUrl filepaths:(NSArray *)files response:(UploadResponseBlock) responseBlock{
    [self upLoadFile:fileUrl filepaths:files headers:nil response:responseBlock];
}

-(void) upLoadFile:(NSString *)fileUrl filepaths:(NSArray *)files headers:(nullable NSDictionary*)headers response:(UploadResponseBlock) responseBlock{
    
     NSMutableURLRequest *request =  [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:fileUrl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
         for (NSString *item in files) {
             [formData appendPartWithFileURL:[NSURL fileURLWithPath:item] name:@"file" fileName:[item lastPathComponent] mimeType:@"image/*" error:nil];
         }
     } error:nil] ;
     
     NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
     if(headers != nil){
         configuration.HTTPAdditionalHeaders = headers;
     }
     
     AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
     NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
         responseBlock(nil,nil,nil,uploadProgress);
     } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
         responseBlock(response,responseObject,error,nil);
     }];
    
    [uploadTask resume];
    
}
@end
