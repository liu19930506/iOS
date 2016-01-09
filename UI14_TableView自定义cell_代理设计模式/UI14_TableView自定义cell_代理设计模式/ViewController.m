//
//  ViewController.m
//  UI14_TableView自定义cell_代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellForCustom.h"
#import "SecondViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CellForCustomDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation ViewController

- (void)dealloc {
    
    [_tableView release];
    [super dealloc];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createTableView];
    [self handleData];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:0 target:self action:@selector(handleNext:)];
}

- (void)handleNext:(UIBarButtonItem *)item {
    
    SecondViewController *second = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:second animated:YES];
    
    [second release];
    
}

- (void)handleData {
    
    self.arr = @[@"zhang", @"wang", @"wu", @"li", @"liu"].mutableCopy;
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[CellForCustom class] forCellReuseIdentifier:@"pool"];
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellForCustom *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    cell.delegate = self;
    
    cell.labelForTitle.text = [self.arr objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - CellForCustom delegate
/** cell */
- (void)handleDeleAction:(CellForCustom *)cell {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    /** 数据 */
    [self.arr removeObjectAtIndex:indexPath.row];
    
    // UI
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
