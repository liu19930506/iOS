//
//  ModelForPerson.m
//  UI20_本地存储(文件形式)
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelForPerson.h"

@implementation ModelForPerson


#pragma mark - 必须实现NSCoding两个协议方法.

/** 反归档时, 自动调用此协议方法 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
       self.name = [aDecoder decodeObjectForKey:@"name"];
       self.sex = [aDecoder decodeObjectForKey:@"sex"];
    }
    return self;
}

/** 归档时, 会调用此协议方法 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
 
    // 将需要保存的属性进行编码
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
}

@end
