//
//  Second.m
//  UI16_作业3(仿qq界面)
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Second.h"

@interface Second ()
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSArray *arr;
@end

@implementation Second

- (void)dealloc {
    
    [_arr release];
    [_scrollView release];
    [super dealloc];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.arr = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.arr.count, 0);
    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    NSLog(@"%f, %f", self.scrollView.frame.origin.x, self.scrollView.frame.origin.y);
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    for (int i = 0; i < self.arr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arr[i]]];
        imageView.frame = CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:imageView];
        [imageView release];
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
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
