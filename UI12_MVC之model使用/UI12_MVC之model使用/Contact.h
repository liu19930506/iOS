//
//  Contact.h
//  UI12_MVC之model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
/** 声明属性, 一般是在数据字典中需要数据对应的key. */
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *hobby;
@property (nonatomic, copy) NSString *photo;

@end
