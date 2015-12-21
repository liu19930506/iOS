//
//  ViewController.m
//  UI04_作业(delegate)
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
@interface ViewController ()<TouchViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    TouchView *touchView = [[TouchView alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width - 100, 50)];
    
    touchView.backgroundColor = [UIColor redColor];
    [self.view addSubview:touchView];
    [touchView release];
    
    
    
    touchView.delegate = self;
    
    
}

- (void)changeColor {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
