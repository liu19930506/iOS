//
//  Picture.m
//  UI07_练习
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Picture.h"

@interface Picture ()

@property (nonatomic, retain) UIScrollView *scroll;

@property (nonatomic, retain) NSMutableArray *arrImages;

@end


@implementation Picture

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self = [self initWithFrame:frame images:nil];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.arrImages = [NSMutableArray arrayWithArray:images];
        
        [self createScrollView:frame];
        
    }
    return self;
}

- (void)createScrollView:(CGRect )frame {
    
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:self.scroll];
    [self.scroll release];
    
    self.scroll.contentSize = CGSizeMake(frame.size.width * self.arrImages.count, frame.size.height);
    
    self.scroll.bounces = YES;
    
    [self createImageViewWithFrame:frame];
    
    self.scroll.pagingEnabled = YES;
    
}

- (void)createImageViewWithFrame:(CGRect )frame {
    
    for (int i = 0; i < self.arrImages.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arrImages[i]]];
        imageView.frame = CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
        [self.scroll addSubview:imageView];
        [imageView release];
    }
    
}

- (void)dealloc {
    
    [_arrImages release];
    [_scroll release];
    [super dealloc];
    
}

@end
