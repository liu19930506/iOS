//
//  Contact.h
//  UI12_作业(MVC重写通讯录)
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
@interface Contact : NSObject


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *hobby;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, retain) UIImage *photoOf;
@property (nonatomic, assign) BOOL flag;

@end
