//
//  CellOfFirst.m
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfFirst.h"
#import "UIImageView+WebCache.h"
#import "ModelOfFirst.h"
@implementation CellOfFirst

- (void)awakeFromNib {
    // Initialization code
    self.labelDigest.numberOfLines = 0;
}

- (void)passHandleData:(ModelOfFirst *)model {
    [self.imageViewLeft sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"3.jpg"]];
    self.labelTitle.text = model.title;
    self.labelDigest.text = model.digest;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
