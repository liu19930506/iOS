//
//  LabelView.m
//  UI04_作业(UILabel实现UIButton功能)
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "LabelView.h"

@implementation LabelView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.label.textAlignment = 1;
        [self addSubview:self.label];
        [self.label release];
        self.label.text = @"这是一个按钮";
     
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.delegate changeColor];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate changeView];
    [self.delegate shuchu];
}

- (void)dealloc {
    [_delegate release];
    [_label release];
    [super dealloc];
}

@end
