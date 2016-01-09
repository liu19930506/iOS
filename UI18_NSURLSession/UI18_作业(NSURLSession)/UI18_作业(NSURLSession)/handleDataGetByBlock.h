//
//  handleDataGetByBlock.h
//  UI18_作业(NSURLSession)
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol handleDataGetByBlockDelegate <NSObject>

- (void)chulishujuBlock:(id)result;

@end

@interface handleDataGetByBlock : NSObject
- (void)handleDataWithString:(NSString *)string;
@property (nonatomic, assign) id<handleDataGetByBlockDelegate>delegate;
@end
