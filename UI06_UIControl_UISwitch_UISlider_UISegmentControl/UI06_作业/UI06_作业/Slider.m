//
//  Slider.m
//  UI06_作业
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Slider.h"

@interface Slider ()

@property (nonatomic, retain) UISlider *slider_red;
@property (nonatomic, retain) UISlider *slider_green;
@property (nonatomic, retain) UISlider *slider_blue;
@property (nonatomic, retain) UISlider *slider_alpha;


@end

@implementation Slider

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        self.slider_red = [[UISlider alloc] initWithFrame:CGRectMake(50, 50, frame.size.width - 100, 40)];
        [self addSubview:self.slider_red];
        [self.slider_red release];
        self.slider_red.minimumTrackTintColor = [UIColor redColor];
        
        self.slider_green = [[UISlider alloc] initWithFrame:CGRectMake(50, 150, frame.size.width - 100, 40)];
        [self addSubview:self.slider_green];
        [self.slider_green release];
        self.slider_green.minimumTrackTintColor = [UIColor greenColor];
        
        self.slider_blue = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, frame.size.width - 100, 40)];
        [self addSubview:self.slider_blue];
        self.slider_blue.minimumTrackTintColor = [UIColor blueColor];
        
        self.slider_alpha = [[UISlider alloc] initWithFrame:CGRectMake(50, 350, frame.size.width - 100, 40)];
        [self addSubview:self.slider_alpha];
        [self.slider_alpha release];
        self.slider_alpha.minimumTrackTintColor = [UIColor blackColor];
        
        [self.slider_red addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        [self.slider_green addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        [self.slider_blue addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        [self.slider_alpha addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void)sliderAction:(UISlider *)slider {
  
    [self superview].backgroundColor = [UIColor colorWithRed:self.slider_red.value green:self.slider_green.value blue:self.slider_blue.value alpha:self.slider_alpha.value];
}

- (void)dealloc {
    
    [_slider_alpha release];
    [_slider_blue release];
    [_slider_green release];
    [_slider_red release];
    [super dealloc];
}

@end
