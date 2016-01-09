//
//  SecondViewController.m
//  UI16_作业(代码)
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation SecondViewController

- (void)dealloc {
    [_arr release];
    [_scrollView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createData];
    self.scrollView = [[UIScrollView alloc] init];
    self.view.backgroundColor = [UIColor grayColor];
    self.scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200);
    self.scrollView.contentSize = CGSizeMake((self.view.frame.size.width) * self.arr.count, 0);
    self.scrollView.bounces = YES;
    self.scrollView.center = self.view.center;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentOffset = CGPointMake(0, 0);
    [self.view addSubview:self.scrollView];
    [self.scrollView release];
    
    for (int i = 0; i < self.arr.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arr[i]]];
        imageView.frame = CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:imageView];
        [imageView release];
    }
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

- (void)timerAction:(NSTimer *)timer {
    
    CGPoint point = self.scrollView.contentOffset;
    
    if (point.x >= self.scrollView.frame.size.width * self.arr.count - 2) {
        point.x = 0;
    }
    point.x += self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:point animated:YES];
}

- (void)createData {
    
    self.arr = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"]];
    
}

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
