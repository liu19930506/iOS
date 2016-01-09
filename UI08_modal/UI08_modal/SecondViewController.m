//
//  SecondViewController.m
//  UI08_modal
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, retain) UIButton *button;
@property (nonatomic, retain) UILabel *label;
@end

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    self.view.backgroundColor = [UIColor greenColor];
    //[self createButton];
    [self createLabel];
    [self createButton];
}

- (void)createLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 80)];
    self.label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
    [self.label release];
    self.label.text = self.strReceive;
    
}

- (void)createButton {
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    [self.button setTitle:@"Back" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor yellowColor];
    [self.button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)backAction:(UIButton *)button {
    
#pragma mark - 通过模态推出来的页面, 如何返回
  
    
        [self dismissViewControllerAnimated:YES completion:^{
    
        }];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
