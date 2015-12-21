//
//  ViewController.m
//  UI05_扩展
//
//  Created by dllo on 15/12/19.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, assign) CGFloat tx;
@property (nonatomic, assign) CGFloat ty;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, assign) CGFloat theta;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"orangeFlower"]];
    [self.view addSubview:self.imageView];
    //self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView release];
    [self fun1];
  
}

- (void)fun1 {
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.imageView addGestureRecognizer:pan];
    [pan release];
    
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    //self.point_end = [pan translationInView:self.imageView];
    //self.imageView.center = CGPointMake(self.point_end.x + self.point_began.x, self.point_end.y + self.point_began.y);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if ([touches anyObject].view == self.imageView) {
        [self.imageView.superview bringSubviewToFront:self.imageView];
        self.tx = self.imageView.transform.tx;
        self.ty = self.imageView.transform.ty;
        self.scale = self.scale;
        
    }
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    if ([touches anyObject].view == self.imageView) {
//        
//        CGPoint pt = [[touches anyObject] locationInView:self.imageView];
//        float dx = pt.x - self.point.x;
//        float dy = pt.y - self.point.y;
//        
//        CGPoint newcenter = CGPointMake(self.imageView.center.x + dx, self.imageView.center.y + dy);
//        self.imageView.center = newcenter;
//    }
//    
//    
//    
//}

//- (void)dealloc {
//    
//    [_imageView release];
//    [super dealloc];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
