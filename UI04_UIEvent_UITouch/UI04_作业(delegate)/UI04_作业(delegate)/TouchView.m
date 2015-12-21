//
//  TouchView.m
//  UI04_作业(delegate)
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, frame.size.height)];
        
        self.textField.borderStyle = 3;
        
        [self addSubview:self.textField];
        [self.textField release];
        
    }
    return self;
}

/** 当结束点击时, 执行 */
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.delegate changeColor];
    
}

- (void)dealloc {
    
    [_textField release];
    [super dealloc];
}



@end
