//
//  RootViewController.m
//  UI03_UIViewController
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "RootViewController.h"
#import "LVTiew.h"
@interface RootViewController ()<UITextFieldDelegate>

@property (nonatomic, retain) UIImageView *imageViewBack;

@end

@implementation RootViewController

#pragma mark - 知识点1 ViewController生命周期

/** ViewController第一方法, 初始化方法, 虽然前面调用的是init方法, 但无论采用何种初始化, 都会调用此初始化方法. */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"%s", __FUNCTION__);
    }
    return self;
}

/** 加载视图. ViewController的view属性, 要指定一个View对象. 如果系统检测view属性没有指向一个View对象, 系统会自动创建一个View对象. */
- (void)loadView {
    /** 一定要调用父类方法 */
    [super loadView];
    
    NSLog(@"%s", __FUNCTION__);
}


/** 视图加载完成. */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s", __FUNCTION__);
    
    self.imageViewBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic_536049_1772a6.jpg"]];
    self.imageViewBack.frame = self.view.frame;
    [self.view addSubview:self.imageViewBack];
    [self.imageViewBack release];
    
    /** 打开imageView用户交互. */
    
    self.imageViewBack.userInteractionEnabled = YES;
    
    /** 用户名和密码 */
    LVTiew *viewOfUser = [[LVTiew alloc] initWithFrame:CGRectMake(50, 350, self.view.frame.size.width - 100, 40)];
    [self.imageViewBack addSubview:viewOfUser];
    [viewOfUser release];
    viewOfUser.labelOfLeft.text = @"用户名:";
    viewOfUser.textFidleOfRight.placeholder = @"请输入用户名";
    
    
    LVTiew *viewPasswd = [[LVTiew alloc] initWithFrame:CGRectMake(50, 420, self.view.frame.size.width - 100, 40)];
    [self.imageViewBack addSubview:viewPasswd];
    [viewPasswd release];
    viewPasswd.labelOfLeft.text = @"密码:";
    viewPasswd.textFidleOfRight.placeholder = @"请输入密码";
    
    /** 指定代理人. */
    viewOfUser.textFidleOfRight.delegate = self;
    viewPasswd.textFidleOfRight.delegate = self;
    
}

#pragma mark - 协议方法

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    /** 背景向上移动. */
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.imageViewBack.frame = CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);
        
    }];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
//    [self.view endEditing:YES];
    
    [textField resignFirstResponder];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.imageViewBack.frame = self.view.frame;
    }];
    
    return YES;
    
}



- (void)dealloc {
    [_imageViewBack release];
    [super dealloc];
}

/** 视图将要显示. */
- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"%s", __FUNCTION__);
}

/** 视图已经显示. */

- (void)viewDidAppear:(BOOL)animated {
    
    NSLog(@"%s", __FUNCTION__);
}

/** 视图将要消失. */
- (void)viewWillDisappear:(BOOL)animated {
    
    NSLog(@"%s", __FUNCTION__);
}

/** 视图已经消失 */
- (void)viewDidDisappear:(BOOL)animated {
    
    NSLog(@"%s", __FUNCTION__);
}

/** ViewController可以检测到系统内存不足的警告, 在此方法中, 要释放适当的内存 */
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
