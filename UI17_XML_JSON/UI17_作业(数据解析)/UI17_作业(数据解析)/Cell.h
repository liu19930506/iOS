//
//  Cell.h
//  UI17_作业(数据解析)
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;

@interface Cell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *labelName;

@property (retain, nonatomic) IBOutlet UILabel *labelDesc;
+ (CGFloat)heightForCell:(Model *)model;
- (void)passModel:(Model *)model;
@end
