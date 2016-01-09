//
//  ViewController.m
//  UI09_代理设计模式新思考
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
@interface ViewController () <TouchViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createTouchView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
}

- (void)beginClick {
    
    NSLog(@"我知道了");

}

- (void)didClick {
    
    
    NSLog(@"打死你");
    
}

- (void)createTouchView {
    
    TouchView *view = [[TouchView alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    [view release];
    view.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
