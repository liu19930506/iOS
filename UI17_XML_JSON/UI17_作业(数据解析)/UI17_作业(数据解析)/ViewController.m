//
//  ViewController.m
//  UI17_作业(数据解析)
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "Model.h"
#import "ParserSAX.h"
#import "ParserDOM.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation ViewController

- (void)dealloc {
    [_arr release];
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"漫画列表";
    [self createTabView];
    [self hanldeData];
    
}

- (void)hanldeData {
    
    self.arr = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Cartoon" ofType:@"xml"];
    ParserSAX *parser = [[ParserSAX alloc] init];
    self.arr = [parser parserSAXWithFile:path];
//    ParserDOM *dom = [[ParserDOM alloc] init];
//    self.arr = [dom parserDOMWithFile:path];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Model *model = [self.arr objectAtIndex:indexPath.row];
    NSLog(@"%f", [Cell heightForCell:model]);
    return [Cell heightForCell:model];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    Model *model = [self.arr objectAtIndex:indexPath.row];
    
    [cell passModel:model];
    
    return cell;
}


- (void)createTabView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"pool"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
