//
//  SecondViewController.m
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "ModelOfFirst.h"
@interface SecondViewController ()
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, assign) BOOL isSave;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, retain) UIButton *buttonCap;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:request];
    
    [self dataFromDisk];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] init];

    self.navigationItem.rightBarButtonItem.customView = [[UIView alloc] init];
    self.navigationItem.rightBarButtonItem.customView.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem.customView.frame = CGRectMake(40, 40, 25, 25);
    [self createButton];
    [self createButtonCap];
   
}

- (void)dataFromDisk {
    NSLog(@"%s", __FUNCTION__);
    self.arr = [NSMutableArray array];
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrayModel.plist"];
    
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    //self.arr = [unarchiver decodeObjectForKey:@"array"];
    NSMutableArray *temp = [NSMutableArray arrayWithArray:[unarchiver decodeObjectForKey:@"array"]];
    [unarchiver finishDecoding];
    
    if (!temp) {
        NSMutableData *mData = [NSMutableData data];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mData];
        [archiver encodeObject:temp forKey:@"array"];
        [archiver finishEncoding];
        [mData writeToFile:file atomically:YES];
        
        NSData *data = [NSData dataWithContentsOfFile:file];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        self.arr = [unarchiver decodeObjectForKey:@"array"];
        [unarchiver finishDecoding];
    }
    self.arr = temp;

    NSLog(@"%@", self.arr);
    
}

#pragma mark - 视图即将出现, 在此判断是否收藏, 显示
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    for (ModelOfFirst *model in self.arr) {
        if ([model.title isEqualToString:self.model.title]) {
            self.isSave = YES;
            break;
        } else {
            self.isSave = NO;
        }
    }
    
    if (self.isSave) {
        self.button.alpha = 0;
        self.buttonCap.alpha = 1;
    } else {
        self.buttonCap.alpha = 0;
        self.button.alpha = 1;
    }
    
    
}
#pragma mark - 收藏功能
- (void)buttonAction:(UIButton *)button {
    NSLog(@"%s", __FUNCTION__);
    
    self.button.alpha = 0;
    self.buttonCap.alpha = 1;
    
    [self.arr addObject:self.model];
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrayModel.plist"];
    
    NSMutableData *mData = [NSMutableData data];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mData];
    
    [archiver encodeObject:self.arr forKey:@"array"];
    
    [archiver finishEncoding];
    
    [mData writeToFile:file atomically:YES];
    
    NSLog(@"%@", NSHomeDirectory());
}

#pragma mark - 取消收藏功能
- (void)buttonCapAction:(UIButton *)buttonCap {
    NSLog(@"%s", __FUNCTION__);
    ModelOfFirst *mod = [[ModelOfFirst alloc] init];
    for (ModelOfFirst *model in self.arr) {
        if ([model.title isEqualToString:self.model.title]) {
            mod = model;
        }
    }
    
    [self.arr removeObject:mod];
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrayModel.plist"];
    
    NSMutableData *mData = [NSMutableData data];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mData];
    
    [archiver encodeObject:self.arr forKey:@"array"];
    
    [archiver finishEncoding];
    
    [mData writeToFile:file atomically:YES];
    
    self.buttonCap.alpha = 0;
    self.button.alpha = 1;
}

#pragma mark - 创建收藏button
- (void)createButton {
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.center = self.navigationItem.rightBarButtonItem.customView.center;
    self.button.frame = CGRectMake(0, 0, self.navigationItem.rightBarButtonItem.customView.frame.size.width, self.navigationItem.rightBarButtonItem.customView.frame.size.height);
    [self.button setBackgroundImage:[UIImage imageNamed:@"iconfont-shoucangweishoucang"] forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem.customView addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 创建取消收藏button
- (void)createButtonCap {
    self.buttonCap = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonCap.center = self.navigationItem.rightBarButtonItem.customView.center;
    self.buttonCap.frame = CGRectMake(0, 0, self.navigationItem.rightBarButtonItem.customView.frame.size.width, self.navigationItem.rightBarButtonItem.customView.frame.size.height);
    [self.buttonCap setBackgroundImage:[UIImage imageNamed:@"iconfont-shoucangyishoucang"] forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem.customView addSubview:self.buttonCap];
    [self.buttonCap addTarget:self action:@selector(buttonCapAction:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
