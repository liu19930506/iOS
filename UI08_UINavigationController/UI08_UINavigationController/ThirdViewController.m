//
//  ThirdViewController.m
//  UI08_UINavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property(nonatomic, retain) UIButton *buttonBack;
@property(nonatomic, retain) UIButton *buttonRootBack;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第三页";
    
    [self createButtonBack];
    [self createButtonRootBack];
}

- (void)createButtonBack {
    self.buttonBack = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.buttonBack];
    [self.buttonBack setTitle:@"返回上一页" forState:UIControlStateNormal];
    self.buttonBack.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    self.buttonBack.backgroundColor = [UIColor greenColor];
    [self.buttonBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

/** 返回上一页 */
- (void)backAction:(UIButton *)button {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)createButtonRootBack {
    
    self.buttonRootBack = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.buttonRootBack];
    [self.buttonRootBack setTitle:@"返回首页" forState:UIControlStateNormal];
    self.buttonRootBack.backgroundColor = [UIColor grayColor];
    self.buttonRootBack.frame = CGRectMake(50, 150, self.view.frame.size.width - 100, 40);
    [self.buttonRootBack addTarget:self action:@selector(backToRootAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

/** 返回首页 */
- (void)backToRootAction:(UIButton *) button {
    
    /** 方法1 */
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    /** 方法2: 从viewControllers数组中取出返回的vc */
    [self.navigationController popToViewController:[self.navigationController.viewControllers firstObject] animated:YES];
}

- (void)dealloc {
    [_buttonBack release];
    [_buttonRootBack release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
