//
//  Picture.m
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Picture.h"

@interface Picture ()

/** 两个控件属性 */
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) UIPageControl *page;

/** 接收数组的属性. */
@property (nonatomic, retain) NSMutableArray *arrImages;

@end





@implementation Picture

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.arrImages = [NSMutableArray arrayWithArray:images];
        
        /** 子控件的创建 */
        [self createScrollWithFrame:frame];
        
    }
    return self;
   
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self = [self initWithFrame:frame images:nil];
    
    }
    return self;
}

#pragma mark - UIScroollView
- (void)createScrollWithFrame:(CGRect)frame {
    
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    [self addSubview:self.scroll];
    [self.scroll release];
    self.scroll.backgroundColor = [UIColor lightGrayColor];
    
    /** API: */
    
    /** 设置contentSize */
    self.scroll.contentSize = CGSizeMake(frame.size.width * self.arrImages.count, frame.size.height);
    
    /** scrollView上面添加imageView对象. */
    [self createImageViewWithFrame:frame];
    
    /** 开启翻页效果 */
    self.scroll.pagingEnabled = YES;
    
    /** 到边缘是否有回弹效果 */
    self.scroll.bounces = YES;

}

- (void)createImageViewWithFrame:(CGRect )frame {
    
    for (int i = 0; i < self.arrImages.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arrImages[i]]];
        [self.scroll addSubview:imageView];
        [imageView release];
        imageView.frame = CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
        
    }
    
}


- (void)dealloc {
    
    [_arrImages release];
    [_page release];
    [_scroll release];
    [super dealloc];
}



@end
