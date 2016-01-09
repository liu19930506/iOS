//
//  SecondViewController.h
//  UI_作业(通讯录)
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Contact;
@protocol SecondViewControllerDelegate <NSObject>

- (void)handData:(Contact *)con;

@end

@interface SecondViewController : UIViewController
@property (nonatomic, assign) id<SecondViewControllerDelegate>delegate;
@property (nonatomic, retain) Contact *con;
@end
