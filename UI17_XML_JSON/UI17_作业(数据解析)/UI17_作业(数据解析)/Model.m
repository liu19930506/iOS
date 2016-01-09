//
//  Model.m
//  UI17_作业(数据解析)
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void)dealloc {
    
    [_name release];
    [_desc release];
    [super dealloc];
    
}

@end
