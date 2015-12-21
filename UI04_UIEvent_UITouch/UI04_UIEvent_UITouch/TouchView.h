//
//  TouchView.h
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TouchViewDelegate <NSObject>

- (void)changeColor;

@end

@interface TouchView : UIView

@property (nonatomic, retain) UITextField *textFieldContent;

@property (nonatomic, assign) id<TouchViewDelegate>delegate;

@end
