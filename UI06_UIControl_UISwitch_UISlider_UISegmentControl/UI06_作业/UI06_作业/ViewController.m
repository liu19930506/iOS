//
//  ViewController.m
//  UI06_作业
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Slider.h"
@interface ViewController ()

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    Slider *slider = [[Slider alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:slider];
    [slider release];

    
}

    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
