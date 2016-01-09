//
//  ViewController.m
//  UI16_可视化编程_StoryBoard
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)handleNext:(id)sender {
    
    // 跳转到下一页.
//    SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:[NSBundle mainBundle]];
    
    /** 当VC的xib文件名和VC类的名字一样时, 初始化方法可以使用init, 系统会首先去找和VC类名相同的xib文件. */
    SecondViewController *second = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:second animated:YES];
    [second release];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
