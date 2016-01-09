//
//  ParserSAX.h
//  UI17_作业(数据解析)
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserSAX : NSObject
- (NSMutableArray *)parserSAXWithFile:(NSString *)filePath;
@end
