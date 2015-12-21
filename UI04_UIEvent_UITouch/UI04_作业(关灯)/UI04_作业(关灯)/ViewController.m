//
//  ViewController.m
//  UI04_作业(关灯)
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addButton];
    
    
    
    
    
    
    
    
    
    
    
    
}


#pragma mark - 添加button块

- (void)addButton {
    
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.backgroundColor = [UIColor yellowColor];
            //[button setBackgroundImage:[UIImage imageNamed:@"1.jpg"]forState:UIControlStateNormal];
            button.frame = CGRectMake(10 * (j + 1) + ((self.view.frame.size.width - 60) / 5) * j, 10 * (i + 1) + ((self.view.frame.size.width - 60) / 5) * i, (self.view.frame.size.width - 60) / 5, (self.view.frame.size.width - 60) / 5);
            button.tag = 2 + 10 * i + j;
            [self.view addSubview:button];
            [button addTarget:self action:@selector(changeColor2:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
   
}



- (void)changeColor:(UIButton *)button {
    
    UIButton *buttonLeft = [self.view viewWithTag:button.tag - 1];
    UIButton *buttonRight = [self.view viewWithTag:button.tag + 1];
    UIButton *buttonUp = [self.view viewWithTag:button.tag - 10];
    UIButton *buttonDown = [self.view viewWithTag:button.tag + 10];
    
    [self modifyImage:button];
    [self modifyImage:buttonLeft];
    [self modifyImage:buttonRight];
    [self modifyImage:buttonUp];
    [self modifyImage:buttonDown];
    
}




- (void)modifyImage:(UIButton *)button {
    
    if ([[button backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"1.jpg"]]) {
        
        [button setBackgroundImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
        
    } else {
        
        [button setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    }
    
}

- (void)changeColor2:(UIButton *)button {
    
    for (int i = 0; i < 56; i++) {
        
        UIButton *temp = [self.view viewWithTag:i];
        
        if (i == button.tag || i == button.tag - 1 || i == button.tag + 1 || i == button.tag + 10 || i == button.tag - 10) {
            if (temp.backgroundColor == [UIColor yellowColor]) {
                temp.backgroundColor = [UIColor blackColor];
            } else {
                temp.backgroundColor = [UIColor yellowColor];
            }
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
