//
//  NetworkHandler.m
//  UI19_网络封装(delegate回调)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "NetworkHandler.h"

@implementation NetworkHandler

/** 通过NSURLSession实现网络请求 */
- (void)networkHandlerJSONWithURL:(NSString *)urlString {
    
    // 将字符串进行转码(URL中不能含有中文等字符)
    NSString *temp = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:temp];
    
    // session
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    // add task
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // 解析
            NSError *errorOfJSON = nil;
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorOfJSON];
            if ([self.delegate respondsToSelector:@selector(handlerDidComplete:)]) {
                [self.delegate handlerDidComplete:result];
            }
            
        });
        
    }];
    
    
    
    [task resume];
    
}

+ (void)handlerJSONWithURL:(NSString *)urlString delegate:(id<NetworkHandlerDelegate>)delegate {
    
    NetworkHandler *hendler = [[NetworkHandler alloc] init];
    
    hendler.delegate = delegate;
    
    [hendler networkHandlerJSONWithURL:urlString];
    
    
    
}

@end
