//
//  CellOfContact.h
//  UI12_作业(MVC重写通讯录)
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;
@interface CellOfContact : UITableViewCell

- (void)passModel:(Contact *)con;

@end
