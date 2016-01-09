//
//  CellOfThird.m
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfThird.h"
#import "ModelOfFirst.h"
@interface CellOfThird ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation CellOfThird

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)passHandleAction:(ModelOfFirst *)model {
    self.label.text = model.title;
}
@end
