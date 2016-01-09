//
//  ViewController.m
//  UI14_UILayer圆角_阴影
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (retain, nonatomic) IBOutlet UIButton *button;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /** 圆角 */
    self.button.layer.cornerRadius = self.button.frame.size.width / 2;
    self.button.layer.masksToBounds = YES;
    
    // 边
    self.button.layer.borderWidth = 1.0f;
    self.button.layer.borderColor = [UIColor redColor].CGColor;
    
    //阴影
    self.button.layer.shadowOffset = CGSizeMake(10, 10);
    self.button.layer.shadowColor = [UIColor grayColor].CGColor;
    /** 边缘模糊效果 */
    self.button.layer.shadowRadius = 3;
    /** 阴影透明度 */
    self.button.layer.shadowOpacity = 1;
    
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_button release];
    [_imageView release];
    [super dealloc];
}
@end
