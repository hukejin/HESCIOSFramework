//
//  ResponseDelegate.h
//  hybridedemo
//  web回调代理
//  Created by pubinfo on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ResponseDelegate <NSObject>

-(void) onResposne:(id) response;

-(void) onError:(id) error;

-(void) onDownLoad:(NSProgress*) progress;

-(void) onUpLoad:(NSProgress*) progress;

@end

NS_ASSUME_NONNULL_END
