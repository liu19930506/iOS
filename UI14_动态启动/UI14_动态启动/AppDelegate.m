//
//  AppDelegate.m
//  UI14_动态启动
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)dealloc {
    
    
    [super dealloc];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    //self.window.rootViewController = VC;
    //self.window.backgroundColor = [UIColor redColor];
    ViewController *VC = [[ViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:VC];
    self.window.rootViewController = navi;
    _splashView = [[UIImageView alloc]initWithFrame:self.window.frame];
//    [_splashView setImage:[UIImage imageNamed:@"4be33b7445012c26509b1.jpeg"]];
    _splashView.backgroundColor = [UIColor blackColor];
    
    [self.window addSubview:_splashView];
    [self.window bringSubviewToFront:_splashView];
    
    
    [self performSelector:@selector(scale_1) withObject:nil afterDelay:0.0f];
    [self performSelector:@selector(scale_2) withObject:nil afterDelay:0.5f];
    [self performSelector:@selector(scale_3) withObject:nil afterDelay:1.0f];
    [self performSelector:@selector(scale_4) withObject:nil afterDelay:1.5f];
    [self performSelector:@selector(scale_5) withObject:nil afterDelay:2.0f];
    [self performSelector:@selector(showWord) withObject:nil afterDelay:2.5f];
    
    
    return YES;
}
- (void)scale_1
{
    UIImageView *round_1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 240, 15, 15)];
    round_1.image = [UIImage imageNamed:@"1"];
    [_splashView addSubview:round_1];
    [self setAnimation:round_1];
}

- (void)scale_2
{
    UIImageView *round_2 = [[UIImageView alloc]initWithFrame:CGRectMake(105, 210, 20, 20)];
    round_2.image = [UIImage imageNamed:@"2"];
    [_splashView addSubview:round_2];
    [self setAnimation:round_2];
}

- (void)scale_3
{
    UIImageView *round_3 = [[UIImageView alloc]initWithFrame:CGRectMake(125, 170, 30, 30)];
    round_3.image = [UIImage imageNamed:@"3"];
    [_splashView addSubview:round_3];
    [self setAnimation:round_3];
}

- (void)scale_4
{
    UIImageView *round_4 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 135, 40, 40)];
    round_4.image = [UIImage imageNamed:@"4"];
    [_splashView addSubview:round_4];
    [self setAnimation:round_4];
}

- (void)scale_5
{
    UIImageView *heart_1 = [[UIImageView alloc]initWithFrame:CGRectMake(140, 190, 100, 100)];
    heart_1.image = [UIImage imageNamed:@"XZ(1R[)[X05@WN7)EQIFL~3(1)"];
    [_splashView addSubview:heart_1];
    [self setAnimation:heart_1];
}


- (void)setAnimation:(UIImageView *)nowView {
    
    [UIView animateWithDuration:0.6f delay:0.0f options:UIViewAnimationOptionCurveLinear
                     animations:^{
         // 执行的动画code
         [nowView setFrame:CGRectMake(nowView.frame.origin.x- nowView.frame.size.width*0.1, nowView.frame.origin.y-nowView.frame.size.height*0.1, nowView.frame.size.width*1.2, nowView.frame.size.height*1.2)];
    }
    completion:^(BOOL finished){
         // 完成后执行code
         [nowView removeFromSuperview];
     }];
  
}

- (void)showWord {
    
    UIImageView *word_ = [[UIImageView alloc]initWithFrame:CGRectMake(75, 440, 170, 29)];
    word_.image = [UIImage imageNamed:@"iconfont-3 (1)"];
    [_splashView addSubview:word_];
    
    word_.alpha = 0.0;
    
    [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionCurveLinear
                     animations:^{
        word_.alpha = 1.0;
    }
    
                     completion:^(BOOL finished) {
            // 完成后执行code
            [NSThread sleepForTimeInterval:1.0f];
            [_splashView removeFromSuperview];
     }];
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
