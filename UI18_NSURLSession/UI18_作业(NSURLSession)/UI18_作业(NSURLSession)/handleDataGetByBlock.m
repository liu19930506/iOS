//
//  handleDataGetByBlock.m
//  UI18_作业(NSURLSession)
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "handleDataGetByBlock.h"

@implementation handleDataGetByBlock
- (void)handleDataWithString:(NSString *)string {
    
    NSURL *url = [NSURL URLWithString:string];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSError *errorOfJSON = nil;
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorOfJSON];
            [self.delegate chulishujuBlock:result];
        });
        
        
    }];
    [task resume];
}
@end
