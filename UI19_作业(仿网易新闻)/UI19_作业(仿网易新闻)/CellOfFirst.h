//
//  CellOfFirst.h
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModelOfFirst;
@interface CellOfFirst : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLeft;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDigest;

- (void)passHandleData:(ModelOfFirst *)model;
@end
