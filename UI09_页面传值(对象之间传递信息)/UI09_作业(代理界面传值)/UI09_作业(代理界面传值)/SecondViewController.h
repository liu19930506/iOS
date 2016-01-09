//
//  SecondViewController.h
//  UI09_作业(代理界面传值)
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewControllerDelegate <NSObject>

- (void)changeValue:(NSString *)str;

@end

@interface SecondViewController : UIViewController

@property (nonatomic, copy) NSString *str;

@property (nonatomic, assign) id<SecondViewControllerDelegate>delegate;
@end
