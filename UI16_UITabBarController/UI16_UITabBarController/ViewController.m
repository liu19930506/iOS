//
//  ViewController.m
//  UI16_UITabBarController
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createButton];
}

- (void)dealloc {
    [_button release];
    [super dealloc];
}
- (void)createButton {
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor redColor];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
}
- (void)buttonAction:(UIButton *)button {
    // 跳转下一界面
    self.tabBarController.selectedIndex = 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
