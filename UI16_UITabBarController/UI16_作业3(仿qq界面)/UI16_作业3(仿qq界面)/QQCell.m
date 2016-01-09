//
//  QQCell.m
//  UI16_作业3(仿qq界面)
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "QQCell.h"


@interface QQCell ()
@property (retain, nonatomic) IBOutlet UIImageView *imageViewLeft;

@end

@implementation QQCell

- (void)awakeFromNib {
    // Initialization code
    self.imageViewLeft.layer.cornerRadius = self.imageViewLeft.frame.size.width / 2;
    self.imageViewLeft.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_imageViewLeft release];
    [super dealloc];
}
@end
