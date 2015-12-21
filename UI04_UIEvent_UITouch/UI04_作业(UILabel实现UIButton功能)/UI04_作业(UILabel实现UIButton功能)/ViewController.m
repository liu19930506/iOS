//
//  ViewController.m
//  UI04_作业(UILabel实现UIButton功能)
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "LabelView.h"
#import "MoveView.h"

@interface ViewController ()<LabelViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    LabelView *labelView = [[LabelView alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width - 100, 50)];
    labelView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:labelView];
    [labelView release];
    labelView.tag = 100;
    
    labelView.delegate = self;
    
    MoveView *moveView = [[MoveView alloc] initWithFrame:CGRectMake(100, 150, 80, 80)];
    moveView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:moveView];
    moveView.tag = 200;
    [moveView release];
    
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    MoveView *temp = [self.view viewWithTag:200];
    
    CGPoint point = [touch locationInView:self.view];
    if (temp == touch.view) {
        
        
        temp.center = point;
    }
    
}

- (void)changeColor {
    
    UIView *temp = [self.view viewWithTag:100];
    temp.backgroundColor = [UIColor orangeColor];
    
    
}

- (void)changeView {
    UIView *temp = [self.view viewWithTag:100];
    temp.frame = CGRectMake(50, 50, self.view.frame.size.width - 150, 50);
}

- (void)shuchu {
    NSLog(@"煞笔别按了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
