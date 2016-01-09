//
//  Cell.m
//  UI18_作业(NSURLSession)
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Cell.h"
#import "Model.h"


@implementation Cell

- (void)passDataWithModel:(Model *)model {
    
    self.label.text = model.title;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
