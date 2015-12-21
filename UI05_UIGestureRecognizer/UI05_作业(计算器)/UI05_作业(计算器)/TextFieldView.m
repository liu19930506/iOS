//
//  TextFieldView.m
//  UI05_作业(计算器)
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "TextFieldView.h"

@implementation TextFieldView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, frame.size.width - 60, 40)];
        [self addSubview:self.label];
        [self.label release];
        self.label.backgroundColor = [UIColor grayColor];
        
        
        
        self.label.layer.cornerRadius = 10;
        self.label.layer.masksToBounds = YES;
        
        
        
        
        
        

      
    }
    return self;
}



- (void)dealloc {
    [_label release];
    
    [super dealloc];
}

@end
