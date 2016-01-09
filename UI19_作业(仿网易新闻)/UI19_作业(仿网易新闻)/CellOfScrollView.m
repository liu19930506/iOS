//
//  CellOfScrollView.m
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfScrollView.h"
#import "UIImageView+WebCache.h"
#import "ModelOfScrollView.h"

@interface CellOfScrollView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *page;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) UIRefreshControl *refresh;
@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, retain) UILabel *label;
@end

@implementation CellOfScrollView

- (void)awakeFromNib {
    // Initialization code
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.label.userInteractionEnabled = YES;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 134, 250, 20)];
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont systemFontOfSize:15];
    [self.scrollView addSubview:self.label];
    [self.contentView insertSubview:self.label aboveSubview:self.scrollView];
    [self.contentView insertSubview:self.page aboveSubview:self.label];
    
}



//- (void)timerAction:(NSTimer *)timer {
//    CGFloat floatX = self.scrollView.contentOffset.x;
//    floatX += self.scrollView.frame.size.width;
//    self.scrollView.contentOffset = CGPointMake(floatX, 0);
//}

- (void)passHandleData:(NSMutableArray *)arr {
    
    ModelOfScrollView *modelMin = [arr firstObject];
    ModelOfScrollView *modelMax = [arr lastObject];
    
    [arr addObject:modelMin];
    [arr insertObject:modelMax atIndex:0];
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * arr.count, self.scrollView.frame.size.height);
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    for (int i = 0; i < arr.count; i++) {
        
        if (1 == i) {
            ModelOfScrollView *model = arr[i];
            self.label.text = model.title;
        }
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        ModelOfScrollView *model = arr[i];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"2222.jpg"]];
        
        [self.scrollView addSubview:imageView];
        
        [self scrollViewDidEndDecelerating:self.scrollView];
  
    }
    self.arr = [NSMutableArray arrayWithArray:arr];
    self.page.numberOfPages = self.arr.count - 2;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
    for (int i = 0; i < self.arr.count; i++) {
        if (i * scrollView.frame.size.width == scrollView.contentOffset.x) {
            ModelOfScrollView *model = self.arr[i];
            self.label.text = model.title;
        }
    }
    
    if (0 == scrollView.contentOffset.x) {
        
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width * (self.arr.count - 2), 0);
        
    }
    if (scrollView.frame.size.width * (self.arr.count - 1) == scrollView.contentOffset.x) {
        
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    }
    
    self.page.currentPage = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    NSLog(@"%f", scrollView.contentOffset.x);
//    NSTimer *timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
