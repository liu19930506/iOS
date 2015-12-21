//
//  AppDelegate.m
//  UI02_UILabel_UITextField_UIButton_UIImageView
//
//  Created by dllo on 15/12/15.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UITextFieldDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    UIViewController *VC = [[UIViewController alloc] init];
    self.window.rootViewController = VC;
    

    [self labelView];
    [self textFieldView];
    [self buttonView];
    [self imageView];
    
    
    [VC release];
    [_window release];
    
    
    return YES;
}

#pragma mark - 知识点1 UILabel

- (void)labelView {
    
    /** 1. 创建对象. */
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 80, 40)];
    labelName.backgroundColor = [UIColor orangeColor];
    [self.window addSubview:labelName];
    [labelName release];
    
    /** 2. 常用API. */
    labelName.text = @"用户名";
    labelName.textColor = [UIColor blueColor];
    
    /** 文本对齐. */
    labelName.textAlignment = NSTextAlignmentCenter;
    
    /** 文本字体. */
    labelName.font = [UIFont systemFontOfSize:20];
    
    /** 文本行数. 0是没有行数限制. */
    labelName.numberOfLines = 3;
    
    /** 断行和省略模式. */
    labelName.lineBreakMode = NSLineBreakByTruncatingHead;
    
    /** 阴影颜色. */
    labelName.shadowColor = [UIColor redColor];
    
    /** 阴影的偏移量 */
    labelName.shadowOffset = CGSizeMake(0, -1);
    
    
    /** 练习: 添加密码UILabel. */
    
    UILabel *code = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 80, 40)];
    code.backgroundColor = [UIColor orangeColor];
    [self.window addSubview:code];
    [code release];
    
    code.text = @"密码";
    code.textColor = [UIColor blueColor];
    code.textAlignment = NSTextAlignmentCenter;
    code.font = [UIFont systemFontOfSize:20];
    code.numberOfLines = 3;
    code.lineBreakMode = NSLineBreakByTruncatingMiddle;
    code.shadowColor = [UIColor redColor];
    code.shadowOffset = CGSizeMake(0, -1);
    
    
}


#pragma mark - 知识点2 UITextField

- (void)textFieldView {
    
    /** 1. 创建对象. */
    UITextField *textFieldOfName = [[UITextField alloc] initWithFrame:CGRectMake(150, 50, 160, 40)];
    
    [self.window addSubview:textFieldOfName];
    [textFieldOfName release];
    
    /** 2. API */
    
    /** 边框风格 */
    textFieldOfName.borderStyle = UITextBorderStyleRoundedRect;
    
    /** 占位符 */
    textFieldOfName.placeholder = @"请输入用户名";
    
    /** 安全输入. */
    textFieldOfName.secureTextEntry = NO;
    
    /** 弹出键盘的类型 */
    textFieldOfName.keyboardType = UIKeyboardTypeDefault;
    
    /** 弹出键盘的风格(亮/暗) */
    textFieldOfName.keyboardAppearance = UIKeyboardAppearanceDark;
    
    textFieldOfName.tag = 100;
    
    textFieldOfName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    /** 键盘回车按键 */
    
    textFieldOfName.returnKeyType = UIReturnKeyNext;
    
    /** 练习: 添加密码textField. */
    
    UITextField *textFieldOfCode = [[UITextField alloc] initWithFrame:CGRectMake(150, 100, 160, 40)];
    
    [self.window addSubview:textFieldOfCode];
    [textFieldOfCode release];
    
    textFieldOfCode.borderStyle = UITextBorderStyleRoundedRect;
    
    textFieldOfCode.placeholder = @"请输入密码";
    
    textFieldOfCode.secureTextEntry = YES;
    
    textFieldOfCode.tag = 200;
    
    textFieldOfCode.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    textFieldOfCode.keyboardAppearance = UIKeyboardAppearanceDefault;
    
    textFieldOfCode.returnKeyType = UIReturnKeyGo;
    
    /** 输入框后面的 清除按键. */
    textFieldOfCode.clearButtonMode = UITextFieldViewModeWhileEditing;

#pragma mark ** textField delegate

    /** 指定delegate. */
    textFieldOfCode.delegate = self;
    textFieldOfName.delegate = self;

}

#pragma mark - TextField协议方法

/** 将要开始编辑的时候, 调用此协议方法 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    /** 显示所在的方法名(函数名), 和行数. */
    NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    NSLog(@"%s, %d", __FUNCTION__, __LINE__);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSLog(@"%s, %d", __FUNCTION__, __LINE__);
}

/** 清空内容时, 调用此方法 */
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    return YES;
}
/** 点击按键上的return按键时, 调用此方法. */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSLog(@"%s, %d", __FUNCTION__, __LINE__);
    
    
    UITextField *txPass = [self.window viewWithTag:200];
    
    /** 回收键盘. */
    if (textField.returnKeyType != UIReturnKeyNext) {
        
        /** 释放第一响应者. */
        [textField resignFirstResponder];
    } else {
        
        [textField resignFirstResponder];
        [txPass becomeFirstResponder];
        
        
    }
 
    return YES;
}

/** 内容方式变化时, 调用此方法. */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"string: %@", string);
    NSLog(@"%ld, %ld", range.location, range.length);
    
    /** 限制输入的长度. */
    if (range.location > 7) {
        return NO;
    }
    
    /** 不能输入的内容判断. */
    if ([string isEqualToString:@"1"]) {
        return NO;
    }
    
    return YES;
}



#pragma mark - 知识点3 UIButton

- (void)buttonView {
    
    /** 1. 创建对象, 类型: 系统默认类型. */
    UIButton *buttonOfComfirm = [UIButton buttonWithType:UIButtonTypeSystem];
    
    buttonOfComfirm.frame = CGRectMake(100, 200, 100, 40);
    
    [self.window addSubview:buttonOfComfirm];
    
    /** 2. API. */
    [buttonOfComfirm setTitle:@"确定" forState:UIControlStateNormal];
    
    /** 指定状态下标题颜色 */
    [buttonOfComfirm setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    /** 添加事件 
     *
     *  控制事件: button向上弹出时调用方法(forControlEvents).
     */
    [buttonOfComfirm addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //UIControlEventTouchDragInside  拖动时调用方法
}

#pragma mark ** Button的点击事件.

- (void)handleAction:(UIButton *)button {
    
    /** 验证用户名和密码是否正确 */
    
    UITextField *tfUser = [self.window viewWithTag:100];
    UITextField *tfPasswd = [self.window viewWithTag:200];
    
    /** 释放键盘 
     *  endEditing 是UIView 的方法, 功能: 释放view以及它的子视图的第一响应状态
     */
    [self.window endEditing:YES];
//    [tfPasswd resignFirstResponder];
//    [tfUser resignFirstResponder];
    
    if ([tfUser.text isEqualToString:@"888888"] && [tfPasswd.text isEqualToString:@"666666"] ) {
        NSLog(@"输入正确");
    } else {
        NSLog(@"用户名/密码错误");
    }
    
    
}



#pragma mark - 知识点4 UIImageView

- (void)imageView {
    
    /** 1. 创建对象. */
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eat_00.jpg"]];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    imageView.center = self.window.center;
    [self.window addSubview:imageView];
    [imageView release];
    
    
    UIButton *buttonIcon = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonIcon.frame = CGRectMake(200, 200, 60, 60);
    [self.window addSubview:buttonIcon];
    
    /** 设置背景图片. 后缀为png可以省略. 注意: 只限于imageNamed */
    [buttonIcon setBackgroundImage:[UIImage imageNamed:@"cymbal"] forState:UIControlStateNormal];
}




- (void)dealloc {
    
    [_window release];
    [super dealloc];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
