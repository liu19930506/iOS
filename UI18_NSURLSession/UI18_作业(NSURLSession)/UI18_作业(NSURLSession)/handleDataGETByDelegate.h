//
//  handleDataGETByDelegate.h
//  UI18_作业(NSURLSession)
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol handleDataGETByDelegateDelegate <NSObject>

- (void)chulishuju:(id)result;

@end

@interface handleDataGETByDelegate : NSObject
@property (nonatomic, retain) NSDictionary *dic;
@property (nonatomic, assign) id<handleDataGETByDelegateDelegate>delegate;
- (void)handleDataWithString:(NSString *)string;
@end
