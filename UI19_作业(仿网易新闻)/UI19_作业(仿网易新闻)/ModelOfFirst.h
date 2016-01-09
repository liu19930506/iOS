//
//  ModelOfFirst.h
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelOfFirst : NSObject<NSCoding>
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *url;
@end
