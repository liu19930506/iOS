//
//  ViewController.m
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Picture.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self createPicView];

    
    
}

#pragma mark - 知识点1 UIScrollView_UIPageControl

/** 详见 Picture类. */

- (void)createPicView {
    
    Picture *pic = [[Picture alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) images:@[@"1.JPG", @"2.JPG", @"3.JPG", @"4.JPG", @"5.JPG", @"6.JPG"]];
    
    [self.view addSubview:pic];
    pic.center = self.view.center;
    [pic release];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
