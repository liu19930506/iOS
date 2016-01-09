//
//  ModelOfFirst.m
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfFirst.h"

@implementation ModelOfFirst
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}



- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.url forKey:@"url"];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
    
    }
    return self;
}
@end
