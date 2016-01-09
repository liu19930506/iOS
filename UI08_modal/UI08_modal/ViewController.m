//
//  ViewController.m
//  UI08_modal
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@property (nonatomic, retain) UIButton *button;
@property (nonatomic, retain) UITextField *textFieldName;
@property (nonatomic, retain) UITextField *textFieldNumber;

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"登录界面";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createButton];
    [self createTextFieldName];
    [self createTextFieldNumber];
   
}

- (void)createTextFieldName {
    
    self.textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 40)];
    self.textFieldName.placeholder = @"请输入账号";
    self.textFieldName.textAlignment = 1;
    self.textFieldName.borderStyle = 3;
    [self.view addSubview:self.textFieldName];
    [self.textFieldName release];
    self.textFieldName.backgroundColor = [UIColor grayColor];
  
}

- (void)createTextFieldNumber {
    
    self.textFieldNumber = [[UITextField alloc] initWithFrame:CGRectMake(50, 250, self.view.frame.size.width - 100, 40)];
    self.textFieldNumber.placeholder = @"请输入密码";
    self.textFieldNumber.textAlignment = 1;
    self.textFieldNumber.borderStyle = 3;
    [self.view addSubview:self.textFieldNumber];
    [self.textFieldNumber release];
    self.textFieldNumber.backgroundColor = [UIColor grayColor];
}

- (void)createButton {
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    [self.button setTitle:@"Next" forState:UIControlStateNormal];
    self.button.layer.cornerRadius = 10;
    self.button.layer.borderWidth = 2;
    
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor yellowColor];
    [self.button addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    
}


//- (void)nextAction:(UIButton *)button {
//
//    /** 首先创建第二界面对象, 注意: 此时在内存中完成了开辟空间. */
//    SecondViewController *second = [[SecondViewController alloc] init];
//    
//    /** 找到第二界面对象, 并且对其中的一个属性进行赋值. 注意: 此时内存中第二界面对象的属性值完成了赋值过程. */
//    second.strReceive = [NSString stringWithFormat:@"%@, %@", self.textFieldName.text, self.textFieldNumber.text];
//    
//    /** 导航控制器将第二界面推入栈中. */
//    [self.navigationController pushViewController:second animated:YES];
//    [second release];
//    
//}

#pragma mark - 知识点1 模态推出ViewController(页面)
- (void)nextAction:(UIButton *)button {

    /** 创建新的页面对象 */
    SecondViewController *second = [[SecondViewController alloc] init];

    /** 模态推出新页面.模态是ViewController方法. */
    second.modalTransitionStyle = UIModalTransitionStylePartialCurl;

    [self presentViewController:second animated:YES completion:^{


    }];

    /** 内存管理 */
    [second release];
}
- (void)dealloc {
    
    [_textFieldName release];
    [_textFieldNumber release];
    [_button release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
