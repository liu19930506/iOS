//
//  ViewController.m
//  UI05_UIGestureRecognizer
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, assign) BOOL isBig;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createImageView];
    [self tap];
    [self longPress];
    [self swip];
    [self screenEdge];
    [self pan];
    [self pin];
    [self rotation];
}

- (void)createImageView {
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    self.imageView.frame = CGRectMake(0, 0, 300, 400);
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView release];
    
    
    
}

#pragma mark - 知识点1 UIGestureRecognizer 类

/** UIGestureRecognizer 手势识别器类
 *
 *  它是抽象类, 不能直接创建对象, 是用它的子类创建对象.
 *  7个子类.
 *  
 *  使用手势的步骤:
 *  1. initWithTarget: action: 创建对象. 
 *  2. 设置相应的参数.
 *  3. 将手势添加到视图上
 *  4. 实现action方法.
 *
 */

#pragma mark - 知识点2 轻拍

- (void)tap {
    
    /** 1. 创建对象 */
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    /** 2. 设置参数(API). */
    
    tap.numberOfTapsRequired = 2;
    
    /** 3. 添加到视图上 */
    
    [self.imageView addGestureRecognizer:tap];
    
    [tap release];
    
}

/** 4. 实现tapAction方法. */

- (void)tapAction:(UITapGestureRecognizer *)tap {
    

    
    if (self.isBig) {
        
        /** 更改frame属性 */
        [UIView animateWithDuration:0.25 animations:^{
            
//            self.imageView.frame = CGRectMake(0, 0, 300, 400);
//            self.imageView.center = self.view.center;
            
            /** 更改transform属性 */
            tap.view.transform = CGAffineTransformScale(tap.view.transform, 1.5, 1.5);
            
            tap.view.transform = CGAffineTransformRotate(tap.view.transform, M_PI);

        }];
        
    } else {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.imageView.frame = CGRectMake(0, 0, 350, 500);
            self.imageView.center = self.view.center;
            
        }];
        
    }
    /** 状态取反 */
    self.isBig = !(self.isBig);
    
    
    
    
}

#pragma mark - 知识点3 长按

- (void)longPress {
    
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressAction:)];
    
    [self.imageView addGestureRecognizer:longP];
    [longP release];
}

- (void)pressAction:(UILongPressGestureRecognizer *)longPress {
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        //NSLog(@"sssss");

    }
    
}

#pragma mark - 知识点4 轻扫

- (void)swip {
    
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    [self.view addGestureRecognizer:swip];
    [swip release];
    
    /** 轻扫方向 */
    swip.direction = UISwipeGestureRecognizerDirectionRight;

}

/** 滑动之后, self.view向右移动1 / 3 */
- (void)swipAction:(UISwipeGestureRecognizer *)swip {
    //NSLog(@"qqqqq");
    
    if (swip.direction == UISwipeGestureRecognizerDirectionRight) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.view.frame = CGRectMake(100, 0, self.view.frame.size.width, self.view.frame.size.height);
            
        }];
        swip.direction = UISwipeGestureRecognizerDirectionLeft;
    } else {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            
        }];
        swip.direction = UISwipeGestureRecognizerDirectionRight;
    }
    
    
    
    
    
}


#pragma mark - 知识点5 屏幕边缘拖动

- (void)screenEdge {
    
    UIScreenEdgePanGestureRecognizer *screen = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgeAction:)];
    [self.view addGestureRecognizer:screen];
    [screen release];
    
    /** 屏幕边缘方向 */
    screen.edges = UIRectEdgeRight;
    
}

- (void)screenEdgeAction:(UIScreenEdgePanGestureRecognizer *)screen {
    
    NSLog(@"zzzzz");
    
}


#pragma mark - UIView 一个重要属性: transform

/** UIView的transform属性, 
 *
 *  transform主要实现: 移动, 缩放, 旋转.
 *
 *  类型: CGAffineTransform, 仿射(几何). 系统提供了方便的API, 进行仿射的计算.
 */

#pragma mark - 知识点6 拖动

- (void)pan {
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.imageView addGestureRecognizer:pan];
    [pan release];
    
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    
    /** 更改 self.imageView.transform属性. */
    
    CGPoint point = [pan translationInView:pan.view];
    NSLog(@"%@", NSStringFromCGPoint(point));
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, point.y);
    
    /** 参考点归零. */
    [pan setTranslation:CGPointZero inView:pan.view];
    
}



#pragma mark - 知识点7 捏合(缩放)

- (void)pin {
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.imageView addGestureRecognizer:pinch];
    [pinch release];
    
}

- (void)pinchAction:(UIPinchGestureRecognizer *)pinch {
    
    /** 修改self.imageView.transform属性 */
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    
    /** 缩放因子归1 */
    pinch.scale = 1;
}


#pragma mark - 知识点8 旋转

- (void)rotation {
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [self.imageView addGestureRecognizer:rotation];
    [rotation release];
    
}

- (void)rotationAction:(UIRotationGestureRecognizer *)rotation {
    NSLog(@"ccccccc");
    /** 更改self.imageView.transform属性 */
    
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    
    /** 弧度归0 */
    rotation.rotation = 0;
}

#pragma mark -

- (void)dealloc {
    
    [_imageView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
