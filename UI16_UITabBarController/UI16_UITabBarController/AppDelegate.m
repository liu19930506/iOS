//
//  AppDelegate.m
//  UI16_UITabBarController
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VCForItem2.h"
#import "VCForItem3.h"
#import "VCForItem4.h"
#import "VCForItem5.h"
#import "VCForItem6.h"
@interface AppDelegate ()<UITabBarControllerDelegate>
@property (nonatomic, retain) UITabBarController *tb;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    [self createTabBarController];

    
    
    [_window release];
    return YES;
}

#pragma mark - 知识点1
- (void)createTabBarController {
    
    // 创建对象.
    self.tb = [[UITabBarController alloc] init];
    self.window.rootViewController = self.tb;
    
    // 设置viewControllers属性.
    
    [self createViewControlls];
    
    // 设置tabBar.
    self.tb.tabBar.tintColor = [UIColor greenColor];
    self.tb.tabBar.backgroundColor = [UIColor grayColor];
    
    
    // delegate
    self.tb.delegate = self;
    
    [_tb release];
}
#pragma mark - tabBarController Delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    // 选中的VC在数组中的下标
    NSLog(@"%ld", tabBarController.selectedIndex);
    
    
    // 徽章清空
    if (1 == tabBarController.selectedIndex) {
        viewController.tabBarItem.badgeValue = nil;
    }
}

- (void)createViewControlls {
    // item1
    
    ViewController *VC = [[ViewController alloc] init];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:VC];
    
    // 设置tabBarItem
    VC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:100];
    
    
    
    // item2
    VCForItem2 *item2 = [[VCForItem2 alloc] init];
    item2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:200];
    
    // 设置徽章
    item2.tabBarItem.badgeValue = @"99+";
    
    // item3, 自定义图片和标题
    VCForItem3 *item3 = [[VCForItem3 alloc] init];
    
    // 图片不被渲染, 保持图片本身的样子.
    item3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[[UIImage imageNamed:@"iconfont-star-round"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:300];
    
    
    // item4
    VCForItem4 *item4 = [[VCForItem4 alloc] init];
    item4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Fast" image:[UIImage imageNamed:@"iconfont-mianxingtubiao1lianxirentongxunlu"] selectedImage:[UIImage imageNamed:@"iconfont-msg"]];
    
    
    
    // item5
    VCForItem5 *item5 = [[VCForItem5 alloc] init];
    item5.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:6 tag:500];
    // item6
    VCForItem6 *item6 = [[VCForItem6 alloc] init];
    item6.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:7 tag:600];
    
    
    // 加入viewControllers数组中.
    self.tb.viewControllers = @[navi, item2, item3, item4, item5, item6];
    [item2 release];
    [item3 release];
    [item4 release];
    [item5 release];
    [item6 release];
    [VC release];
}

- (void)dealloc {
    [_tb release];
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
