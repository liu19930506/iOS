//
//  ViewController.m
//  UI08_UINavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface ViewController ()

@property (nonatomic, retain) UIButton *buttonNext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    [self createButton];
    
    [self changeNavigationItem];

    
    /** 设置标题. */
//    self.title = @"首页";
    
    
}

#pragma mark - UINavigationBar

- (void)changeBar {
    
    /** 导航栏显隐属性 */
    self.navigationController.navigationBarHidden = YES;
    
    /** 导航栏样式. */
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    /** 导航栏背景颜色. */
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    
    /** 导航栏上面Item的颜色. */
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
}

#pragma mark - UINavigationItem 

- (void)changeNavigationItem {
    
    /** 中间的标题部分. */
//    self.navigationItem.title = @"首页";

    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"消息", @"通话"]];
    self.navigationItem.titleView = seg;
    seg.selectedSegmentIndex = 0;
    [seg release];
    
    /** 左边部分. */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
    
    /** 右边部分. */
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pinkFlower"] style:UIBarButtonItemStylePlain target:self action:@selector(xiaohuaAction:)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"小花" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction:)];
    
    self.navigationItem.rightBarButtonItems = @[item1, item2];
}

- (void)xiaohuaAction:(UIBarButtonItem *)barButton {
    NSLog(@"%s", __FUNCTION__);
}

- (void)saveAction:(UIBarButtonItem *)barButton {
    NSLog(@"%s", __FUNCTION__);
}

- (void)searchAction:(UIBarButtonItem *)barBurron {
    NSLog(@"%s", __FUNCTION__);
}

- (void)createButton {
    
    self.buttonNext = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonNext.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    
    [self.buttonNext setTitle:@"Next" forState:UIControlStateNormal];
    self.buttonNext.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.buttonNext];
    
    [self.buttonNext addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)nextAction:(UIButton *)button {
    
    /** 创建第二页VC对象. */
    SecondViewController *second = [[SecondViewController alloc] init];
    

    
    
    /** PUSH(推入)第二界面. */
    [self.navigationController pushViewController:second animated:YES];
    [second release];
    
}

/** 视图将要出现的时候, 调用此方法. 
 *
 *  注意, 从第二界面返回到此页面时, 也会调用此方法.
 */

- (void)viewWillAppear:(BOOL)animated {
    [self changeBar];
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated {
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
