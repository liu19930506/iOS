//
//  ViewController.m
//  UI13_作业
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellOfNews.h"
#import "ModelOfNews.h"
#import "SecondViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation ViewController

- (void)dealloc {
    
    [_tableView release];
    [_arr release];
    [super dealloc];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
    [self handleData];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"20140907223321_zKuEj.thumb.700_0.jpeg"]];
    self.tableView.backgroundView = imageView;
    [imageView release];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:blur];
    self.tableView.separatorEffect = vibrancy;
}

- (void)handleData {
    
    self.arr = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"News.txt" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *arr = [result objectForKey:@"news"];
    for (NSDictionary *dic in arr) {
        
        /** kvc赋值 */
        ModelOfNews *model = [[ModelOfNews alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arr addObject:model];
        [model release];
    }
    
}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
       
        
    }];
    
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    action2.backgroundColor = [UIColor purpleColor];
    
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    action3.backgroundColor = [UIColor darkGrayColor];
    
    
    return @[action1, action2, action3];
}





#pragma mark - tableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ModelOfNews *model = [self.arr objectAtIndex:indexPath.row];
    
    return [CellOfNews heightForCell:model];
}

/** 点击cell协议 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
    [second release];
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 先从池中取, 没有的话创建(init方法重写) */
    CellOfNews *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    /** 赋值方法 */
    [cell passModel:[self.arr objectAtIndex:indexPath.row]];
    
    return cell;
    
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[CellOfNews class] forCellReuseIdentifier:@"pool"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
