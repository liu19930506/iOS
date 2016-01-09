//
//  ViewController.m
//  UI09_作业(代理界面传值)
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()<SecondViewControllerDelegate>

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLabel];
    [self createButton];
    
}

- (void)changeValue:(NSString *)str {
    self.label.text = str;
}

- (void)createButton {
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(100, 100, 80, 40);
    self.button.center = self.view.center;
    [self.button setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor grayColor];
    
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonAction:(UIButton *)button {
    
    SecondViewController *second = [[SecondViewController alloc] init];
    second.str = self.label.text;
    [self.navigationController pushViewController: second animated:YES];
    [second release];
    
    second.delegate = self;
    
}

- (void)createLabel {
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 40)];
    [self.view addSubview:self.label];
    [self.label release];
    self.label.text = @"lalala";
    self.label.textAlignment = 1;
    self.label.backgroundColor = [UIColor yellowColor];
    
}

- (void)dealloc {
    
    [_label release];
    [_button release];
    [super dealloc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
