//
//  LTView.m
//  UI03_作业
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "LTView.h"

@implementation LTView




- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.labelOfLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 3, frame.size.height)];
        [self addSubview:self.labelOfLeft];
        self.labelOfLeft.backgroundColor = [UIColor grayColor];
        self.labelOfLeft.textAlignment = 1;
        [self.labelOfLeft release];
        
        self.textFieldOfRight = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width * 2 / 3, frame.size.height)];
        [self addSubview:self.textFieldOfRight];
        self.textFieldOfRight.borderStyle = 3;
        self.textFieldOfRight.backgroundColor = [UIColor whiteColor];
        [self.labelOfLeft release];
        
        
    }
    return self;
}


- (void)dealloc {

    [_labelOfLeft release];
    [_textFieldOfRight release];
    [super dealloc];
    
}

@end
