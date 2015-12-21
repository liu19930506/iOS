//
//  ViewController.m
//  UI06_作业2
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:view2];
    [view2 release];
    view2.tag = 200;
    view2.backgroundColor = [UIColor blueColor];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view2 addSubview:label2];
    [label2 release];
    label2.text = @"注册";
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:50];
    
    UIView *view3 = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:view3];
    [view3 release];
    view3.tag = 300;
    view3.backgroundColor = [UIColor redColor];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view3 addSubview:label3];
    [label3 release];
    label3.text = @"忘记密码";
    label3.textColor = [UIColor blackColor];
    label3.font = [UIFont systemFontOfSize:20];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view1.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view1];
    view1.tag = 100;
    [view1 release];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view1 addSubview:label1];
    [label1 release];
    label1.text = @"登录";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:50];
    
    
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"登录", @"注册", @"忘记密码"]];
    [self.view addSubview:seg];
    
    
    [seg release];
    seg.frame = CGRectMake(50, 500, 300, 60);
    seg.selectedSegmentIndex = 0;
    
    [seg addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
    

}

- (void)segAction:(UISegmentedControl *)seg {
    
    switch (seg.selectedSegmentIndex) {
        case 0:
            
            [self.view insertSubview:[self.view viewWithTag:100] belowSubview:seg];
            
            break;
            
            case 1:
            
            [self.view insertSubview:[self.view viewWithTag:200] belowSubview:seg];
            
            break;
            
            case 2:
            
            [self.view insertSubview:[self.view viewWithTag:300] belowSubview:seg];
            
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
