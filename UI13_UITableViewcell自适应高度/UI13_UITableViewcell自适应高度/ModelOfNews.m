//
//  ModelOfNews.m
//  UI13_UITableViewcell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ModelOfNews.h"

@implementation ModelOfNews

- (void)dealloc {
    
    [_summary release];
    [_title release];
    [super dealloc];
    
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
