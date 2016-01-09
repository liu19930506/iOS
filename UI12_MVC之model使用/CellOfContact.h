//
//  CellOfContact.h
//  UI12_MVC之model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Contact;

@interface CellOfContact : UITableViewCell

/** 声明一个方法, 传入一个model数据过来. */
- (void)passModel:(Contact *)con;
/** 声明一个model属性, 用来接收外部的model数据. */
@property (nonatomic, retain) Contact *con;
@end
