//
//  SecondViewController.m
//  UI08_UINavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()
@property (nonatomic, retain) UIButton *buttonNext;
@end

@implementation SecondViewController

- (void)dealloc {
    
    [_buttonNext release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    [self createButton];
    self.navigationController.navigationBarHidden = NO;
    
    
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)createButton {
    
    self.buttonNext = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonNext setTitle:@"next" forState:UIControlStateNormal];
    [self.view addSubview:self.buttonNext];
    self.title = @"第二页";
    self.buttonNext.backgroundColor = [UIColor orangeColor];
    self.buttonNext.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    [self.buttonNext addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)nextAction:(UIButton *)button {
    
    ThirdViewController *third = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController: third animated:YES];
    [third release];
    
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
