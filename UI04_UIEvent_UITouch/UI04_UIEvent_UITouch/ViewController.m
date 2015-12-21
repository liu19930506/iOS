//
//  ViewController.m
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
#import "MoveView.h"


#define WTDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface ViewController ()<TouchViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self touchEvent];
    [self moveView];
    
   
}



#pragma mark - 知识点1 事件(UIEvent)

/** UIEvent有三种事件: 触摸(UITouch), 摇晃, 远程控制.
 *
 *  本节课重点: 触摸事件(touch).
 */

#pragma mark - 知识点2 触摸

- (void)touchEvent {
    
    /** 触摸就是硬件能感应到手指触摸屏幕.
     *
     *  重点: 触摸之后的操作.(重写touch相关的方法(开始触摸, 触摸移动, 触摸结束))
     */
    
    /** 创建一个自定义View(TouchView) */
    
    TouchView *viewTouch = [[TouchView alloc] initWithFrame:CGRectMake(50, 50, WTDTH - 100, 50)];
    viewTouch.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewTouch];
    [viewTouch release];
    viewTouch.delegate = self;
    
}




- (void)changeColor {
    self.view.backgroundColor = [UIColor grayColor];
}

#pragma mark - 点击空白区域, 回收键盘

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"controller 相应结束触摸");
    [self.view endEditing:YES];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"controller 响应开始触摸");
}


#pragma mark - 知识点3 控件随着手指移动

- (void)moveView {
    
    MoveView *viewMove = [[MoveView alloc] initWithFrame:CGRectMake(100, 120, 50, 50)];
    viewMove.backgroundColor = [UIColor redColor];
    viewMove.tag = 100;
    [self.view addSubview:viewMove];
    [viewMove release];
    
    
    
    
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"controller响应移动");
    
    /** 从参数touches里面获取UITouch对象. */
    UITouch *t = [touches anyObject];
    
    /** 获取touch对象在View上的坐标. */
    CGPoint point = [t locationInView:self.view];
    NSLog(@"%f, %f", point.x, point.y);
    
    /** 使moveView的中心点和手指的坐标点一样. */
    
    UIView *temp = [self.view viewWithTag:100];
    
    if (t.view == temp) {
        
        temp.center = point;
        
    }
    
}

#pragma mark - 知识点4 响应者链

    /** UIResponder 类(响应者类)
     *
     *  UIResponder 是个抽象类(不能用抽象类直接创建对象), 用它的子类创建对象.
     *
     *  UIView, UIViewController, UIApplication等都是它的子类.
     *
     *  响应者链就是由UIResponder子类对象组成的图层关系.
     *
     *
     */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
