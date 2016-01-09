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
    self.view.backgroundColor = [UIColor blackColor];
    
    [self createPicView];
    
    
    
    
}

#pragma mark - 知识点1 UIScrollView_UIPageControl
/** 详见Picture 类. */
- (void)createPicView {
    
    Picture *pic = [[Picture alloc]initWithFrame:self.view.frame images:@[@"1.jpg", @"2.jpg", @"3.jpg"]];
    [self.view addSubview:pic];
    pic.center = self.view.center;
    [pic release];
    
}




#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
