//
//  ViewController.m
//  UI10_作业
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrData;
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self handleData];
    [self createTableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (void)handleData {
    
    self.arrData = @[
                     @{@"name":@"路飞", @"money":@"200000000", @"image":@"1"},
                     @{@"name":@"索隆", @"money":@"200000000", @"image":@"2"},
                     @{@"name":@"罗宾", @"money":@"200000000", @"image":@"3"},
                     @{@"name":@"香吉士", @"money":@"200000000", @"image":@"4"},
                     @{@"name":@"布鲁克", @"money":@"200000000", @"image":@"5"},
                     @{@"name":@"弗兰克", @"money":@"200000000", @"image":@"6"},
                     @{@"name":@"乌索普", @"money":@"200000000", @"image":@"7"},
                     @{@"name":@"娜美", @"money":@"200000000", @"image":@"8"},
                     @{@"name":@"乔巴", @"money":@"200000000", @"image":@"9"},
                     ].mutableCopy;
    
}

/** 默认的Row数 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *pool1 = @"reuse";
    
    /** 从重用池中取cell */
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool1];
    
    /** 没有重用池创建 */
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:3 reuseIdentifier:pool1]autorelease];
    }
    
    
    
    /** 取书数组中的字典 */
    NSDictionary *dic = [self.arrData objectAtIndex:indexPath.row];
    
    
    /** 下载数据 */
    cell.textLabel.text = [dic objectForKey:@"name"];
    
    cell.detailTextLabel.text = [dic objectForKey:@"money"];
    
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    
    return cell;
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    self.tableView.rowHeight = 100;
    
}

/** 当点击按下执行 协议方法 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SecondViewController *second = [[SecondViewController alloc] init];
    self.delegate = second;
    
    /** 根据row得到数组中所对应的字典 */
    NSDictionary *dic = [self.arrData objectAtIndex:indexPath.row];
    
    
    
    [self.delegate handImageView:dic];
    
    [self.navigationController pushViewController:second animated:YES];
 
    [second release];
    
}



- (void)dealloc {
    
    [_arrData release];
    [_tableView release];
    [super dealloc];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
