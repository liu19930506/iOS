//
//  handleDataGETByDelegate.m
//  UI18_作业(NSURLSession)
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "handleDataGETByDelegate.h"

@interface handleDataGETByDelegate ()<NSURLSessionDataDelegate, NSURLSessionDelegate, NSURLSessionTaskDelegate>
@property (nonatomic, retain) NSMutableData *data;
@end

@implementation handleDataGETByDelegate

- (void)handleDataWithString:(NSString *)string {
    
    self.data = [NSMutableData data];
    self.dic = [NSDictionary dictionary];
    
    NSURL *url = [NSURL URLWithString:string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    
    [task resume];
    
    
}
#pragma mark - NSURLSessionDataDelegate
/** 传数据时调用此方法, 可能多次调用 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    [self.data appendData:data];
}
#pragma mark - NSURLSessionTaskDelegate
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    // 解析
    NSError *errorOfJSON = nil;
    id result = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:&errorOfJSON];
    [self.delegate chulishuju:result];
}




@end
