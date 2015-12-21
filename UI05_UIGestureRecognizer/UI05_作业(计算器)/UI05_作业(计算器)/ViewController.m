//
//  ViewController.m
//  UI05_作业(计算器)
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self chuangjianchuangkou];
    
    self.mStr = [[NSMutableString alloc] init];
    
    
}



#pragma mark - 创建显示屏及按键
- (void)chuangjianchuangkou {
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, self.view.frame.size.width - 60, 40)];
    [self.view addSubview:self.label];
    self.label.textAlignment = NSTextAlignmentRight;
    [self.label release];
    self.label.backgroundColor = [UIColor grayColor];
    self.label.text = @"0";
    
    
    self.label.layer.cornerRadius = 10;
    self.label.layer.masksToBounds = YES;
    
    
    self.arr = @[@"C", @"%", @"X", @"<-", @"7", @"8", @"9", @"-", @"4", @"5", @"6", @"+", @"1", @"2", @"3", @"()", @"0", @".", @"+/-", @"="];
    
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 4; j++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(35 + ((self.label.frame.size.width - 40) / 4) * j + 10 * j, 200 + ((self.view.frame.size.height - 300) / 5) * i + 10 * i, (self.label.frame.size.width - 40) / 4, (self.view.frame.size.height - 300) / 5);
            [button setTitle:self.arr[i * 4 + j] forState:UIControlStateNormal];
            button.tag = i * 4 + j + 1;
            [button setTintColor:[UIColor whiteColor]];
            button.titleLabel.font = [UIFont systemFontOfSize:20];
            button.userInteractionEnabled = YES;
            if ((0 == i && j < 5) || (1 == i && 3 == j) || (2 == i && 3 == j) || (3 == i && 3 == j) || (4 == i && 3 == j)) {
                button.backgroundColor = [UIColor orangeColor];
            } else {
                button.backgroundColor = [UIColor grayColor];
            }
            
            [button.layer setCornerRadius:10];
            [self.view addSubview:button];
            
            if (1 == button.tag) {
                
                [button addTarget:self action:@selector(qingchu:) forControlEvents:UIControlEventTouchUpInside];
                
            } else if (2 == button.tag || 3 == button.tag || 8 == button.tag || 12 == button.tag) {
                
                [button addTarget:self action:@selector(jisuan:) forControlEvents:UIControlEventTouchUpInside];
                
            } else if (5 == button.tag || 6 == button.tag || 7 == button.tag || 9 == button.tag || 10 == button.tag || 11 == button.tag || 13 == button.tag || 14 == button.tag|| 15 == button.tag|| 17 == button.tag || 18 == button.tag) {
                
                [button addTarget:self action:@selector(panduan:) forControlEvents:UIControlEventTouchUpInside];
                
            } else if (20 == button.tag) {
                
                [button addTarget:self action:@selector(jieguo:) forControlEvents:UIControlEventTouchUpInside];
                
            } else if (4 == button.tag) {
                [button addTarget:self action:@selector(huitui:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
}

- (void)panduan:(UIButton *)button {
    
//    if (_biaoji1 > 1 || _biaoji2 > 1 || _biaoji3 > 1 || _biaoji4 > 1) {
//        [self jieguo:button];
//    }
        if ([self.mStr hasPrefix:@"+"] || [self.mStr hasPrefix:@"-"] || [self.mStr hasPrefix:@"X"] || [self.mStr hasPrefix:@"%"]) {
            
            [self.mStr setString:@""];
            
            
        } else {
            
            [self.mStr appendString:button.currentTitle];
            self.label.text = [NSMutableString stringWithString:self.mStr];
            self.num1 = [self.label.text doubleValue];
            NSLog(@"sum1: %lf", self.num1);
            NSLog(@"sum2: %lf", self.num2);
        }
        
        
        
    
    
    
}

- (void)jisuan:(UIButton *)button {
    
    [self.mStr setString:@""];
    
    [self.mStr appendString:button.currentTitle];
    
    //self.label.text = [NSString stringWithString:self.mStr];
//    NSLog(@"%@", self.mStr);
    
    if ([_mStr isEqualToString:@"+"]) {
        
        self.flag = 1;
        self.num2 = self.num1;
        //self.biaoji1 += 1;
        
    } else if ([_mStr isEqualToString:@"-"]) {
        
        self.flag = 2;
        self.num2 = self.num1;
        
    } else if ([_mStr isEqualToString:@"X"]) {
        
        self.flag = 3;
        self.num2 = self.num1;
    } else if ([_mStr isEqualToString:@"%"]) {
        
        self.flag = 4;
        self.num2 = self.num1;
    }
}

- (void)jieguo:(UIButton *)button {
    
    if (1 == _flag) {
        
        self.sum = self.num2 + [self.label.text doubleValue];
        self.label.text = [NSString stringWithFormat:@"%g", self.sum];
        self.num1 = [self.label.text doubleValue];
        //self.num1 = self.sum;
        self.sum = 0;
        [self.mStr setString:@""];
        NSLog(@"sum1: %lf", self.num2);
    }
    if (2 == _flag) {
        self.sum = self.num2 - [self.label.text doubleValue];
        self.label.text = [NSString stringWithFormat:@"%g", self.sum];
        self.num1 = self.sum;
        self.sum = 0;
        [self.mStr setString:@""];
        
    }
    if (3 == _flag) {
        self.sum = self.num2 * [self.label.text doubleValue];
        self.label.text = [NSString stringWithFormat:@"%g", self.sum];
        self.num1 = self.sum;
        self.sum = 0;
        [self.mStr setString:@""];
        
    }
    if (4 == _flag) {
        self.sum = self.num2 / [self.label.text doubleValue];
        self.label.text = [NSString stringWithFormat:@"%g", self.sum];
        self.num1 = self.sum;
        self.sum = 0;
        [self.mStr setString:@""];
        
    }
    
    
}

- (void)qingchu:(UIButton *)button {
    
    [self.mStr setString:@""];
    self.num2 = 0;
    self.num1 = 0;
    self.sum = 0;
    self.label.text = @"0";
}

- (void)huitui:(UIButton *)button {
    if (![_mStr isEqualToString:@""]) {

        [self.mStr deleteCharactersInRange: NSMakeRange(self.mStr.length - 1, 1)];
        self.label.text = [NSString stringWithString:self.mStr];
    }
}

- (void)dealloc {
    [_arr release];
    [_label release];
    [_mStr release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
