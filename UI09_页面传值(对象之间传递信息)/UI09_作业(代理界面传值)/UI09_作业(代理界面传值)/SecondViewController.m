//
//  SecondViewController.m
//  UI09_作业(代理界面传值)
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIButton *button;


@end

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    [self createTextField];
    [self createButton];
    
    
}

- (void)createButton {
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(100, 100, 80, 40);
    [self.view addSubview:self.button];
    [self.button setTitle:@"返回" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor whiteColor];
    
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonAction:(UIButton *)button {
    
    [self.delegate changeValue:self.textField.text];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)createTextField {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 40)];
    [self.view addSubview:self.textField];
    [self.textField release];
    self.textField.placeholder = self.str;
    self.textField.backgroundColor = [UIColor whiteColor];
    
}

- (void)dealloc {
    [_textField release];
    [_button release];
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
