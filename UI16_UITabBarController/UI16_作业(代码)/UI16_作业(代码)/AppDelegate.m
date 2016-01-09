//
//  AppDelegate.m
//  UI16_作业(代码)
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface AppDelegate ()
@property (nonatomic, retain) UITabBarController *tb;
@end

@implementation AppDelegate

- (void)dealloc {
    [_tb release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    [self createTabBarController];
    
    [_window release];
    return YES;
}

- (void)createTabBarController {
    
    ViewController *VC = [[ViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:VC];
    VC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第一页" image:[UIImage imageNamed:@"iconfont-disanfang"] tag:100];
    [VC release];
    
    self.tb = [[UITabBarController alloc] init];
    self.window.rootViewController = self.tb;
    
    SecondViewController *second = [[SecondViewController alloc] init];
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:second];
    navi2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第二页" image:[UIImage imageNamed:@"iconfont-iconfont09"] tag:200];
    
    [second release];
    
    ThirdViewController *third = [[ThirdViewController alloc] init];
    UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:third];
    third.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第三页" image:[UIImage imageNamed:@"iconfont-xiangce"] tag:300];
    
    [third release];
    
    
    self.tb.viewControllers = @[navi, navi2, navi3];
    [_tb release];
    

    
    
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
