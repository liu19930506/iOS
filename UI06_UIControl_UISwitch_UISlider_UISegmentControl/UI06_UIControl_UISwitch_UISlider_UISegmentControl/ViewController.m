//
//  ViewController.m
//  UI06_UIControl_UISwitch_UISlider_UISegmentControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIImageView *imageViewZombie;

@property (nonatomic, retain) UISwitch *sw;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createImageView];
    [self createSwitch];
    [self createSlider];
    [self createSegment];
    
}



- (void)createImageView {
    
    self.imageViewZombie = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BZombie1.tiff"]];
    self.imageViewZombie.frame = CGRectMake(0, 0, 300, 350);
    self.imageViewZombie.center = self.view.center;
    [self.view addSubview:self.imageViewZombie];
    [_imageViewZombie release];
    
    /** 动画 */
    NSMutableArray *arrAni = [NSMutableArray array];
    
    for (int i = 1; i < 26; i++) {
        
        NSString *name = [NSString stringWithFormat:@"BZombie%d.tiff", i];
        UIImage *image = [UIImage imageNamed:name];
        [arrAni addObject:image];
        
    }
    self.imageViewZombie.animationImages = arrAni;
    
    self.imageViewZombie.animationDuration = arrAni.count * 0.001;
    
    self.imageViewZombie.animationRepeatCount = 0;
    
    //[self.imageViewZombie startAnimating];
    
}

- (void)dealloc {
    
    [_sw release];
    [_imageViewZombie release];
    [super dealloc];
    
}
#pragma mark - 知识点1 UISwitch(开关控件)
- (void)createSwitch {
    
    self.sw = [[UISwitch alloc] initWithFrame:CGRectMake(50, 50, 0, 0)];
    
    [self.view addSubview:self.sw];
    [self.sw release];
    
    /** API: */
    self.sw.tintColor = [UIColor redColor];
    self.sw.onTintColor = [UIColor redColor];
    self.sw.thumbTintColor = [UIColor blackColor];
    
    /** 添加事件. */
    [self.sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
}

/** 控制动画开关 */
- (void)switchAction:(UISwitch *)sw {
    NSLog(@"%s", __FUNCTION__);
    if (sw.on) {
        [self.imageViewZombie startAnimating];
    } else {
        [self.imageViewZombie stopAnimating];
    }
}


#pragma mark - 知识点2 UISlider(滑动条)
- (void)createSlider {
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    [self.view addSubview:slider];
    [slider release];
    
    /** API: */
    slider.minimumValue = 1;
    slider.maximumValue = 10;
    slider.minimumValueImage = [UIImage imageNamed:@"iconfont-icon05"];
    slider.maximumValueImage = [UIImage imageNamed:@"iconfont-tuzi"];
    
    /** 添加事件. */
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
}

/** 控制动画速度. */
- (void)sliderAction:(UISlider *)slider {
    
    
    if (slider.value > 5) {
        [slider setValue:10 animated:YES];
    }
    
    self.imageViewZombie.animationDuration = self.imageViewZombie.animationImages.count * (0.1 / slider.value);
    
    if ([self.sw isOn]) {
        
        [self.imageViewZombie startAnimating];
        
        
    
    }

}

#pragma mark - 知识点3 UISegmentdContorl

- (void)createSegment {
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"红", @"黄", @"蓝"]];
    seg.frame = CGRectMake(50, 500, 300, 40);
    [self.view addSubview:seg];
    [seg release];
    [seg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];

    /** 默认选中的item */
    seg.selectedSegmentIndex = 2;

}

/** 界面颜色切换 */
- (void)segmentAction:(UISegmentedControl *)seg {
    
    switch (seg.selectedSegmentIndex) {
        case 0:
            
            self.view.backgroundColor = [UIColor redColor];
            break;
            
        case 1:
            
            self.view.backgroundColor = [UIColor yellowColor];
            break;
            
        case 2:
            
            self.view.backgroundColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
    
    
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
