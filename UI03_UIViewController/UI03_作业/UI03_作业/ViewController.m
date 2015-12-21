//
//  ViewController.m
//  UI03_作业
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "LTView.h"
@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark - 添加vc.view背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    

#pragma mark - 在view2上添加注册界面
    
    UIView *view2 = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view2];
    view2.tag = 200;
    [view2 release];
    
    
    LTView *logonViewName = [[LTView alloc] initWithFrame:CGRectMake(40, 140, self.view.frame.size.width - 100, 40)];
    logonViewName.labelOfLeft.text = @"用户名:";
    logonViewName.textFieldOfRight.placeholder = @"请输入用户名";
    logonViewName.textFieldOfRight.clearButtonMode = UITextFieldViewModeWhileEditing;
    [view2 addSubview:logonViewName];
    
    logonViewName.textFieldOfRight.delegate = self;
    
    LTView *logonViewLogon = [[LTView alloc] initWithFrame:CGRectMake(40, 200, self.view.frame.size.width - 100, 40)];
    logonViewLogon.labelOfLeft.text = @"密码:";
    logonViewLogon.textFieldOfRight.placeholder = @"请输入密码";
    [view2 addSubview:logonViewLogon];
    
    logonViewLogon.textFieldOfRight.delegate = self;
    
    LTView *logonViewYesLogon = [[LTView alloc] initWithFrame:CGRectMake(40, 260, self.view.frame.size.width - 100, 40)];
    logonViewYesLogon.labelOfLeft.text = @"确认密码:";
    logonViewYesLogon.textFieldOfRight.placeholder = @"请输入密码";
    [view2 addSubview:logonViewYesLogon];
    
    logonViewLogon.textFieldOfRight.delegate = self;
    
    LTView *logonViewPhone = [[LTView alloc] initWithFrame:CGRectMake(40, 320, self.view.frame.size.width - 100, 40)];
    logonViewPhone.labelOfLeft.text = @"手机号:";
    logonViewPhone.textFieldOfRight.placeholder = @"请输入手机号";
    [view2 addSubview:logonViewPhone];
    
    logonViewPhone.textFieldOfRight.delegate = self;
    
    LTView *logonViewE_mail = [[LTView alloc] initWithFrame:CGRectMake(40, 380, self.view.frame.size.width - 100, 40)];
    logonViewE_mail.labelOfLeft.text = @"邮箱:";
    logonViewE_mail.textFieldOfRight.placeholder = @"请输入邮箱";
    [view2 addSubview:logonViewE_mail];
    
    logonViewE_mail.textFieldOfRight.delegate = self;
    
    UIButton *logonButtonLogon = [UIButton buttonWithType:UIButtonTypeSystem];
    logonButtonLogon.frame = CGRectMake(40, 450, 80, 20);
    [view2 addSubview:logonButtonLogon];
    logonButtonLogon.backgroundColor = [UIColor whiteColor];
    [logonButtonLogon setTitle:@"注册" forState:UIControlStateNormal];
    
    UIButton *logonButtonNo = [UIButton buttonWithType:UIButtonTypeSystem];
    logonButtonNo.frame = CGRectMake(140, 450, 80, 20);
    [view2 addSubview:logonButtonNo];
    logonButtonNo.backgroundColor = [UIColor whiteColor];
    [logonButtonNo setTitle:@"取消" forState:UIControlStateNormal];
    [logonButtonNo addTarget:self action:@selector(quxiaozhuse:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - 在view3上添加邮箱找回界面

    UIView *view3 = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view3];
    view3.tag = 300;
    [view3 release];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(120, 140, self.view.frame.size.width - 100, 40)];
    textField.placeholder = @"请输入邮箱";
    [view3 addSubview:textField];
    
    textField.delegate = self;
    
    UIButton *button_view3_zhaohui = [UIButton buttonWithType:UIButtonTypeSystem];
    button_view3_zhaohui.frame = CGRectMake(80, 250, 100, 20);
    [button_view3_zhaohui setTitle:@"找回" forState:UIControlStateNormal];
    [view3 addSubview:button_view3_zhaohui];
    
    UIButton *button_view3_quxiao = [UIButton buttonWithType:UIButtonTypeSystem];
    button_view3_quxiao.frame = CGRectMake(180, 250, 100, 20);
    [button_view3_quxiao setTitle:@"取消" forState:UIControlStateNormal];
    [view3 addSubview:button_view3_quxiao];
    
    [button_view3_quxiao addTarget:self action:@selector(view3Quxiao:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - 创建view1
    UIView *view1 = [[UIView alloc] init];
    view1.frame = self.view.frame;
    view1.tag = 100;
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    [view1 release];
    
#pragma mark - 在view1上添加登陆界面控件
    
    /** 添加用户名 */
    LTView *viewOfUser = [[LTView alloc] initWithFrame:CGRectMake(40, 150, self.view.frame.size.width - 100, 40)];
    viewOfUser.labelOfLeft.text = @"用户名:";
    viewOfUser.textFieldOfRight.placeholder = @"请输入账号";
    [view1 addSubview:viewOfUser];
    [viewOfUser release];
    
    viewOfUser.textFieldOfRight.delegate = self;
    
    /** 添加密码 */
    LTView *viewPasswd = [[LTView alloc] initWithFrame:CGRectMake(40, 250, self.view.frame.size.width - 100, 40)];
    viewPasswd.labelOfLeft.text = @"密码:";
    viewPasswd.textFieldOfRight.placeholder = @"请输入密码";
    [view1 addSubview:viewPasswd];
    [viewPasswd release];
    
    viewPasswd.textFieldOfRight.delegate = self;
    
    
    
#pragma mark - 添加textField代理事件
    
    
    
    
    
    
#pragma mark - 添加button按钮
    
    UIButton *buttonLand = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonLand.frame = CGRectMake(40, 330, 80, 20);
    [view1 addSubview:buttonLand];
    buttonLand.backgroundColor = [UIColor whiteColor];
    [buttonLand setTitle:@"登录" forState:UIControlStateNormal];
    
    
    UIButton *buttonCode = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonCode.frame = CGRectMake(140, 330, 80, 20);
    [view1 addSubview:buttonCode];
    buttonCode.backgroundColor = [UIColor whiteColor];
    [buttonCode setTitle:@"找回密码" forState:UIControlStateNormal];
    
    [buttonCode addTarget:self action:@selector(view1Zhaohuimima:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonLogon = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonLogon.frame = CGRectMake(240, 330, 80, 20);
    [view1 addSubview:buttonLogon];
    buttonLogon.backgroundColor = [UIColor whiteColor];
    [buttonLogon setTitle:@"注册" forState:UIControlStateNormal];
    [buttonLogon addTarget:self action:@selector(zhuce:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)quxiaozhuse:(UIButton *)button {
    UIView *temp = [self.view viewWithTag:100];
    [self.view bringSubviewToFront:temp];
}

- (void)zhuce:(UIButton *)button {
    UIView *temp = [self.view viewWithTag:200];
    [self.view bringSubviewToFront:temp];
}

- (void)view3Quxiao:(UIButton *)button {
    
    UIView *temp = [self.view viewWithTag:100];
    [self.view bringSubviewToFront:temp];
    
}

- (void)view1Zhaohuimima:(UIButton *)button {
    
    UIView *temp = [self.view viewWithTag:300];
    [self.view bringSubviewToFront:temp];
    
}





#pragma mark - 代理方法

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    [textField resignFirstResponder];
    
    return YES;
}


- (void)dealloc {
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
