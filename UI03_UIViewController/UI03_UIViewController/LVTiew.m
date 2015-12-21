//
//  LVTiew.m
//  UI03_UIViewController
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "LVTiew.h"

@implementation LVTiew

- (instancetype)initWithFrame:(CGRect)frame {
    
    
    
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 3, frame.size.height)];
        [self addSubview:self.labelOfLeft];
        [_labelOfLeft release];
        
        self.textFidleOfRight = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width * 2 / 3, frame.size.height)];
        [self addSubview:self.textFidleOfRight];
        [_textFidleOfRight release];
        
        self.textFidleOfRight.borderStyle = UITextBorderStyleRoundedRect;
    }
    return self;
}

- (void)dealloc {
    
    [_labelOfLeft release];
    [_textFidleOfRight release];
    [super dealloc];
}

@end
