//
//  ViewController.m
//  UI05_作业(qq界面)
//
//  Created by dllo on 15/12/19.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addImageViewBack];
    [self addQueryFence];
    [self tapHead];
    [self swipe];
    [self addBack];
    
    [self addImageViewHead];
    [self addButton];
    [self pin];
    [self pan];
    
#pragma mark - 指定代理人(键盘回收)
    self.textField.delegate = self;
    
  
    
}

#pragma mark - 添加imageView2Head手势事件

/** 缩放 */

- (void)pin {
    
    UIPinchGestureRecognizer *pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.imageView addGestureRecognizer:pin];
    [pin release];
}

- (void)pinchAction:(UIPinchGestureRecognizer *)pin {
    
    pin.view.transform = CGAffineTransformScale(pin.view.transform, pin.scale, pin.scale);
    pin.scale = 1;
    
}

/** 移动 */

- (void)pan {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.imageView2Head addGestureRecognizer:pan];
    [pan release];
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    CGPoint point = [pan translationInView:pan.view];
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, point.y);
    [pan setTranslation:CGPointZero inView:pan.view];
    [self.view insertSubview:pan.view aboveSubview:self.imageView];
    
}

#pragma mark - 插入一层背景在imageView下

- (void)addBack {
    
    self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back1.jpg"]];
    self.imageView2.frame = self.view.frame;
    [self.view insertSubview:self.imageView2 belowSubview:self.imageView];
    self.imageView2.userInteractionEnabled = YES;
    [self.imageView2 release];
    
}

#pragma mark - 轻扫屏幕

- (void)swipe {
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    [self.imageView addGestureRecognizer:swipe];
    [swipe release];
    
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
}

- (void)swipeAction:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.imageView.frame = CGRectMake(300, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
            
        }];
        swipe.direction = UISwipeGestureRecognizerDirectionLeft;
        
    } else {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.imageView.frame = CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
            
        }];
        swipe.direction = UISwipeGestureRecognizerDirectionRight;
    }
    
    
    
}

#pragma mark - 点击头像

- (void)tapHead {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    /** 点击几下, 响应 */
    tap.numberOfTapsRequired = 1;
    [self.imageViewHead addGestureRecognizer:tap];
    [tap release];
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    
    if (!_flag) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.imageView.frame = CGRectMake(300, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
            
        }];
        
    } else {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.imageView.frame = CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
            
        }];
        
    }
    self.flag = !self.flag;
    
    
}

#pragma mark - 添加button

- (void)addButton {
    
    self.button_xiaoxi = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.imageView addSubview:self.button_xiaoxi];
    self.button_xiaoxi.frame = CGRectMake(40, 570, 50, 50);
    [self.button_xiaoxi setBackgroundImage:[UIImage imageNamed:@"xiaoxi"] forState:UIControlStateNormal];
    
    self.button_lianxiren = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.imageView addSubview:self.button_lianxiren];
    self.button_lianxiren.frame = CGRectMake(160, 570, 50, 50);
    [self.button_lianxiren setBackgroundImage:[UIImage imageNamed:@"lianxiren"] forState:UIControlStateNormal];
    
    self.button_dongtai = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.imageView addSubview:self.button_dongtai];
    self.button_dongtai.frame = CGRectMake(280, 570, 50, 50);
    [self.button_dongtai setBackgroundImage:[UIImage imageNamed:@"dongtai"] forState:UIControlStateNormal];
    
    self.button_shezhi = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.imageView2 addSubview:self.button_shezhi];
    self.button_shezhi.frame = CGRectMake(40, 570, 50, 50);
    [self.button_shezhi setBackgroundImage:[UIImage imageNamed:@"shezhi"] forState:UIControlStateNormal];
    
    self.button_yejianmoshi = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.imageView2 addSubview:self.button_yejianmoshi];
    self.button_yejianmoshi.frame = CGRectMake(160, 570, 50, 50);
    [self.button_yejianmoshi setBackgroundImage:[UIImage imageNamed:@"yejianmoshi"] forState:UIControlStateNormal];
    
}

#pragma mark - 键盘回收

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.textField resignFirstResponder];
    return YES;
    
}

#pragma mark - 添加搜索栏

- (void)addQueryFence {
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 40)];
    [self.imageView addSubview:self.textField];
    [self.textField release];
    self.textField.placeholder = @"搜索";
    self.textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo"]];
    self.textField.leftView.backgroundColor = [UIColor whiteColor];
    self.textField.leftViewMode = UITextFieldViewModeUnlessEditing;
    self.textField.clearButtonMode = 1;
    self.textField.leftView.frame = CGRectMake(self.view.frame.size.width - 40, 140, 20, 20);
    
    self.textField.alpha = 0.7;
    self.textField.textAlignment = 0;
    self.textField.borderStyle = 3;
    self.textField.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 添加头像

- (void)addImageViewHead {
    
    self.imageViewHead = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Head2.jpg"]];
    [self.imageView addSubview:self.imageViewHead];
    [self.imageViewHead release];
    self.imageViewHead.frame = CGRectMake(30, 30, 60, 60);
    self.imageViewHead.layer.cornerRadius = self.imageViewHead.frame.size.width / 2;
    self.imageViewHead.clipsToBounds = YES;
    self.imageViewHead.layer.borderWidth = 3.0f;
    self.imageViewHead.userInteractionEnabled = YES;
    self.imageViewHead.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.imageView2Head = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Head2.jpg"]];
    [self.imageView2 addSubview:self.imageView2Head];
    [self.imageView2Head release];
    self.imageView2Head.frame = CGRectMake(30, 30, 60, 60);
    self.imageView2Head.layer.cornerRadius = self.imageView2Head.frame.size.width / 2;
    self.imageView2Head.clipsToBounds = YES;
    self.imageView2Head.layer.borderWidth = 3.0f;
    self.imageView2Head.userInteractionEnabled = YES;
    self.imageView2Head.layer.borderColor = [UIColor grayColor].CGColor;
}


#pragma mark - 添加背景

- (void)addImageViewBack {
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back2.jpg"]];
    self.imageView.frame = self.view.frame;
    //self.imageView.alpha = 0.5;
    [self.view addSubview:self.imageView];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView release];
}

- (void)dealloc {
    
    [_imageView2Head release];
    [_imageView2 release];
    [_button_shezhi release];
    [_button_yejianmoshi release];
    [_button_dongtai release];
    [_button_lianxiren release];
    [_button_xiaoxi release];
    [_imageViewHead release];
    [_textField release];
    [_imageView release];
    [super dealloc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
