//
//  AppDelegate.m
//  UI01_作业
//
//  Created by dllo on 15/12/14.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /** 创建5个UIView
     要求 ：
     1.命名 view1 ~ view5
     2.分别设置背景颜色红、黄、绿、蓝、灰
     3.位置与大小自定义。
     4.设置UIView常用属性。（数据自定） */
#if 0
    {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
        UIViewController *VC = [[UIViewController alloc] init];
        self.window.rootViewController = VC;
        
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
        view1.center = CGPointMake(self.window.frame.size.width / 2, self.window.frame.size.height / 2);
        view1.backgroundColor = [UIColor brownColor];
        //view1.alpha = 0.5f;
        [self.window addSubview:view1];
        [view1 release];
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        view2.center = CGPointMake(self.window.frame.size.width / 2, self.window.frame.size.height / 2);
        view2.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //view2.alpha = 0.5f;
        [self.window addSubview:view2];
        [view2 release];
        
        UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        view3.center = CGPointMake(self.window.frame.size.width / 2, self.window.frame.size.height / 2);
        view3.backgroundColor = [UIColor redColor];
        //view2.alpha = 0.5f;
        [self.window addSubview:view3];
        [view3 release];
        
        UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        view4.center = CGPointMake(self.window.frame.size.width / 2, self.window.frame.size.height / 2);
        view4.backgroundColor = [UIColor blueColor];
        //view4.alpha = 0.5f;
        [self.window addSubview:view4];
        [view4 release];
        
        UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        view5.center = CGPointMake(self.window.frame.size.width / 2, self.window.frame.size.height / 2);
        view5.backgroundColor = [UIColor purpleColor];
        //view5.alpha = 0.5f;
        [self.window addSubview:view5];
        [view5 release];
        
        [VC release];
        [_window release];
    }
#endif
    
#if 0
    {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor brownColor];
        [self.window makeKeyAndVisible];
        
        UIViewController *VC = [[UIViewController alloc] init];
        self.window.rootViewController = VC;
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
        button1.frame = CGRectMake(40, 100, 80, 40);
        button1.backgroundColor = [UIColor blueColor];
        [self.window addSubview:button1];
        [button1 setTitle:@"点击1" forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(dianji1:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
        button2.frame = CGRectMake(240, 100, 80, 40);
        button2.backgroundColor = [UIColor blueColor];
        [self.window addSubview:button2];
        [button2 setTitle:@"点击2" forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(dianji2:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
        button3.frame = CGRectMake(40, 200, 80, 40);
        button3.backgroundColor = [UIColor blueColor];
        [self.window addSubview:button3];
        [button3 setTitle:@"点击3" forState:UIControlStateNormal];
        [button3 addTarget:self action:@selector(dianji3:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
        button4.frame = CGRectMake(240, 200, 80, 40);
        button4.backgroundColor = [UIColor blueColor];
        [self.window addSubview:button4];
        [button4 setTitle:@"点击4" forState:UIControlStateNormal];
        [button4 addTarget:self action:@selector(dianji4:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button5 = [UIButton buttonWithType:UIButtonTypeSystem];
        button5.frame = CGRectMake(240, 300, 80, 40);
        button5.backgroundColor = [UIColor blueColor];
        [self.window addSubview:button5];
        [button5 setTitle:@"点击5" forState:UIControlStateNormal];
        [button5 addTarget:self action:@selector(dianji5:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button6 = [UIButton buttonWithType:UIButtonTypeSystem];
        button6.frame = CGRectMake(40, 300, 80, 40);
        button6.backgroundColor = [UIColor blueColor];
        [self.window addSubview:button6];
        [button6 setTitle:@"点击6" forState:UIControlStateNormal];
        [button6 addTarget:self action:@selector(dianji6:) forControlEvents: UIControlEventTouchUpInside];
        
        
        [VC release];
        [_window release];
    }
#endif
    
#if 1
    {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
        UIViewController *VC = [[UIViewController alloc] init];
        self.window.rootViewController = VC;
        
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 5; j++) {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.window.frame.size.width / 5 * j, self.window.frame.size.height / 8 * i, self.window.frame.size.width / 5 , self.window.frame.size.height / 8)];
                view.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.f green:arc4random() % 256 / 255.f blue:arc4random() % 256 / 255.f alpha:1.0];
                [self.window addSubview:view];
                [view release];
            }
        }
        
        
        
        
        [VC release];
        [_window release];
    }
    
    
    

    
    
    
#endif
    
    
    
    return YES;
}

- (void)dianji6:(UIButton *)button {
    NSLog(@"点击6");
}

- (void)dianji5:(UIButton *)button {
    NSLog(@"点击5");
}

- (void)dianji4:(UIButton *)button {
    NSLog(@"点击4");
}

- (void)dianji3:(UIButton *)button {
    NSLog(@"点击3");
}

- (void)dianji2:(UIButton *)button {
    NSLog(@"点击2");
}

- (void)dianji1:(UIButton *)button {
    NSLog(@"点击1");
}

- (void)dealloc {
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
