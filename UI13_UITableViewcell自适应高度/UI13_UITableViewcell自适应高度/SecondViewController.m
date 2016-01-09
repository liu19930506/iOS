//
//  SecondViewController.m
//  UI13_UITableViewcell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "CellForImage.h"



@interface SecondViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *arr;

@end

@implementation SecondViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    [self handleData];
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[CellForImage class] forCellReuseIdentifier:@"pool"];
    
}

- (void)handleData {
    
    self.arr = @[@"20140907223321_zKuEj.thumb.700_0.jpeg", @"1446196324974.jpg", @"1444355366354.jpg", @"122AFAFE-FBBC-43FB-8A44-7E5E1A26689E.jpg"];
    
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CellForImage *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    /** 赋值. */
    cell.imageViewForPic.image = [UIImage imageNamed:[self.arr objectAtIndex:indexPath.row]];
    
 
    return cell;
}

/** 返回每一行的高度. */
- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 从数组中取出字符串. */
    NSString *name = [self.arr objectAtIndex:indexPath.row];
    
    
    /** 调用cell的方法, 计算高度. */
    return [CellForImage heightForCellWithName:name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
