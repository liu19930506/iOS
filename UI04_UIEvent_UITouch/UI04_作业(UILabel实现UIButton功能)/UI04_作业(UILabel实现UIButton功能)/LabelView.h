//
//  LabelView.h
//  UI04_作业(UILabel实现UIButton功能)
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LabelViewDelegate <NSObject>

- (void)changeColor;

- (void)changeView;

- (void)shuchu;

@end

@interface LabelView : UIView

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, assign) id<LabelViewDelegate> delegate;

@end
