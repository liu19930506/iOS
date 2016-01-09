//
//  ViewController.h
//  UI10_作业
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewControllerDelegate.h"




@interface ViewController : UIViewController

@property (nonatomic, assign) id<ViewControllerDelegate>delegate;

@end

