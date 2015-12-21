//
//  LTView.m
//  UI03_自定义View
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "LTView.h"

@implementation LTView


/** 因为LTView类在外部使用时, 使用父类initWithFrame:方法初始化, 因此重写这个方法, 目的: 创建两个子控件 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        /** 创建子视图. */
        self.labelOfLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 3, frame.size.height)];
        
        
        /** 子视图添加到父视图上 */
        [self addSubview:self.labelOfLeft];
        self.labelOfLeft.backgroundColor = [UIColor grayColor];
        [_labelOfLeft release];
        
        
        
        self.textFieldOfRight = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width * 2 / 3, frame.size.height)];
        
        
        [self addSubview:self.textFieldOfRight];
        self.textFieldOfRight.backgroundColor = [UIColor whiteColor];
        [_textFieldOfRight release];
        
        
        self.textFieldOfRight.borderStyle = UITextBorderStyleRoundedRect;
    }
    return self;
    
}

- (void)dealloc {
    [_labelOfLeft release];
    [_textFieldOfRight release];
    [super dealloc];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end
