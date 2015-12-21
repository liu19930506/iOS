//
//  TouchView.m
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (void)dealloc {
    [_textFieldContent release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.textFieldContent = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, frame.size.height)];
        [self addSubview:self.textFieldContent];
        self.textFieldContent.borderStyle = 3;
        [_textFieldContent release];
        
        
        
        
    }
    return self;
}

/** 重写touch相关方法 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"TouchView 开始触摸");
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"TouchView 移动");
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.delegate changeColor];
    
    NSLog(@"TouchView 触摸结束");
}

@end
