//
//  AppDelegate.m
//  UI02_作业(Tom Cat)
//
//  Created by dllo on 15/12/15.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property(nonatomic, retain) UIImageView *imageViewBackground;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#pragma mark - 创建window及视图控制器
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController *VC = [[UIViewController alloc] init];
    self.window.rootViewController = VC;
    
#pragma mark - 添加背景
    
    self.imageViewBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"angry_0.jpg"]];
    self.imageViewBackground.frame = self.window.frame;
    [self.window addSubview:self.imageViewBackground];
    [self.imageViewBackground release];
        
#pragma mark - 添加按钮
    
//    NSArray *imageArr = [NSArray arrayWithObjects:@"cymbal", @"drink", @"eat", @"fart", @"pie", @"scratch", nil];
//    for (int i = 0; i < imageArr.count; i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//        
//        button.frame = CGRectMake(20 + (i % 2) * 280 , (i / 2) * 80 + 400, 60, 60);
//        button setBackgroundImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>
//        [self.imageViewBackground addSubview:button];
//    }
    
    
    
    
//    [self addButtonCymbal];
//    [self addButtonDrink];
//    [self addButtonEat];
//    [self addButtonFart];
//    [self addButtonPie];
//    [self addButtonScratch];
    
    
    
    
    [VC release];
    [_window release];
    
    return YES;
}






/** 添加按钮scratch */
- (void)addButtonScratch {
    
    UIButton *buttonScratch = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonScratch.frame = CGRectMake(320, 630, 60, 60);
    [buttonScratch setBackgroundImage:[UIImage imageNamed:@"scratch"] forState:UIControlStateNormal];
    [self.window addSubview:buttonScratch];
    [buttonScratch addTarget:self action:@selector(handleActionScratch:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleActionScratch:(UIButton *)button {
    UIImageView *temp = [self.window viewWithTag:100];

    if (temp.isAnimating) {
        return;
    }
    
    
    NSMutableArray *tomImage = [NSMutableArray array];
    
    for (int i = 0; i < 56; i++) {
        NSString *name = [NSString stringWithFormat:@"scratch_%d.jpg", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        [tomImage addObject:img];
        [img release];
    }
    
    temp.animationImages = tomImage;
    
    /** 设置动画参数 */
    
    temp.animationDuration = 5;
    temp.animationRepeatCount = 1;
    [temp startAnimating];
    
    
    [[self.window viewWithTag:100] performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:temp.animationDuration];
    //temp.animationImages = nil;
}

/** 添加按钮pie */
- (void)addButtonPie {
    
    UIButton *buttonPie = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonPie.frame = CGRectMake(320, 530, 60, 60);
    [buttonPie setBackgroundImage:[UIImage imageNamed:@"pie"] forState:UIControlStateNormal];
    [self.window addSubview:buttonPie];
    [buttonPie addTarget:self action:@selector(handleActionPie:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleActionPie:(UIButton *)button {
    UIImageView *temp = [self.window viewWithTag:100];
    if (temp.isAnimating) {
        return;
    }
    
    NSMutableArray *tomImage = [NSMutableArray array];
    
    for (int i = 0; i < 24; i++) {
        NSString *name = [NSString stringWithFormat:@"pie_%d.jpg", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        [tomImage addObject:img];
        [img release];
    }
    
    temp.animationImages = tomImage;
    
    /** 设置动画参数 */
    
    temp.animationDuration = 4;
    temp.animationRepeatCount = 1;
    [temp startAnimating];
    
    [[self.window viewWithTag:100] performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:temp.animationDuration];
}

/** 添加按钮fart */
- (void)addButtonFart {
    
    UIButton *buttonFart = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonFart.frame = CGRectMake(320, 430, 60, 60);
    [buttonFart setBackgroundImage:[UIImage imageNamed:@"fart"] forState:UIControlStateNormal];
    [self.window addSubview:buttonFart];
    [buttonFart addTarget:self action:@selector(handleActionFart:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleActionFart:(UIButton *)button {
    UIImageView *temp = [self.window viewWithTag:100];
    if (temp.isAnimating) {
        return;
    }
    
    NSMutableArray *tomImage = [NSMutableArray array];
    
    for (int i = 0; i < 28; i++) {
        NSString *name = [NSString stringWithFormat:@"fart_%d.jpg", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        [tomImage addObject:img];
        [img release];
    }
    
    temp.animationImages = tomImage;
    
    /** 设置动画参数 */
    
    temp.animationDuration = 4;
    temp.animationRepeatCount = 1;
    [temp startAnimating];
    
    [[self.window viewWithTag:100] performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:temp.animationDuration];
}

/** 添加按钮eat */
- (void)addButtonEat {
    
    UIButton *buttonEat = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonEat.frame = CGRectMake(30, 630, 60, 60);
    [buttonEat setBackgroundImage:[UIImage imageNamed:@"eat"] forState:UIControlStateNormal];
    [self.window addSubview:buttonEat];
    /** 添加按钮点击事件 */
    [buttonEat addTarget:self action:@selector(handleActionEat:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleActionEat:(UIButton *)button {
    
    UIImageView *temp = [self.window viewWithTag:100];
    if (temp.isAnimating) {
        return;
    }
    NSMutableArray *tomImage = [NSMutableArray array];
    //UIImage *image = [UIImage imageNamed:@"eat_0"];
    for (int i = 0; i < 40; i++) {
        NSString *name = [NSString stringWithFormat:@"eat_%d.jpg", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        [tomImage addObject:img];
        [img release];
    }
    
    temp.animationImages = tomImage;
    
    /** 设置动画参数 */
    
    temp.animationDuration = 2;
    temp.animationRepeatCount = 1;
    [temp startAnimating];
    
    
    [[self.window viewWithTag:100] performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:temp.animationDuration];
    
}



/** 添加按钮drink */
- (void)addButtonDrink {
    
    UIButton *buttonDrink = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonDrink.frame = CGRectMake(30, 530, 60, 60);
    [buttonDrink setBackgroundImage:[UIImage imageNamed:@"drink"] forState:UIControlStateNormal];
    [self.window addSubview:buttonDrink];
    [buttonDrink addTarget:self action:@selector(handleActionDrink:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)handleActionDrink:(UIButton *)button {
    
    UIImageView *temp = [self.window viewWithTag:100];
    
    if (temp.isAnimating) {
        return;
    }
    
    NSMutableArray *tomImage = [NSMutableArray array];
    
    for (int i = 0; i < 81; i++) {
        NSString *name = [NSString stringWithFormat:@"drink_%d.jpg", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        [tomImage addObject:img];
        [img release];
    }
    
    temp.animationImages = tomImage;
    
    /** 设置动画参数 */
    
    temp.animationDuration = 6;
    temp.animationRepeatCount = 1;
    [temp startAnimating];
    
    [[self.window viewWithTag:100] performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:temp.animationDuration];
}

/** 添加按钮cymbal */
- (void)addButtonCymbal {
    
    UIButton *buttonCymbal = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonCymbal.frame = CGRectMake(30, 430, 60, 60);
    [buttonCymbal setBackgroundImage:[UIImage imageNamed:@"cymbal"] forState:UIControlStateNormal];
    [self.window addSubview:buttonCymbal];
    
    [buttonCymbal addTarget:self action:@selector(handleActionCymbal:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)handleActionCymbal:(UIButton *)button {

    UIImageView *temp = [self.window viewWithTag:100];
    if (temp.isAnimating) {
        return;
    }
    
    NSMutableArray *tomImage = [NSMutableArray array];
    
    for (int i = 0; i < 13; i++) {
        NSString *name = [NSString stringWithFormat:@"cymbal_%d.jpg", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        [tomImage addObject:img];
        [img release];
    }
    
    temp.animationImages = tomImage;
    
    /** 设置动画参数 */
    
    temp.animationDuration = 2;
    temp.animationRepeatCount = 1;
    [temp startAnimating];
    
    [[self.window viewWithTag:100] performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:temp.animationDuration];
}








- (void)dealloc {
    
    [_imageViewBackground release];
    [_window release];
    [super dealloc];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
