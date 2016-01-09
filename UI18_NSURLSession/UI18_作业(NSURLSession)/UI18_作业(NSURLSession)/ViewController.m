//
//  ViewController.m
//  UI18_作业(NSURLSession)
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#import "Cell.h"
#import "Model.h"
#import "handleDataGETByDelegate.h"
#import "handleDataGetByBlock.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, handleDataGetByBlockDelegate, handleDataGETByDelegateDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.arr = [NSMutableArray array];
   
    NSLog(@"%s", __FUNCTION__);
    [self handleData];
    [self createTableView];
    [self setupRefresh];
    
}

- (void)setupRefresh {
    
    MJRefreshNormalHeader *refresh = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
    
    [self.tableView addSubview:refresh];
    
    
    refresh = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction:)];
    [refresh beginRefreshing];
    
}

- (void)refreshAction:(MJRefreshNormalHeader *)refresh {
    handleDataGETByDelegate *hanlde = [[handleDataGETByDelegate alloc] init];
    hanlde.delegate = self;
    [hanlde handleDataWithString:@"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1"];
    
    [self.tableView reloadData];
    [refresh endRefreshing];
}

- (void)chulishuju:(id)result {
    
        NSArray *arr = [result objectForKey:@"newsList"];
        for (NSDictionary *dic in arr) {
    
            Model *model = [[Model alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.arr addObject:model];
            
        }
    //NSLog(@"%@", self.arr);
    NSLog(@"%s", __FUNCTION__);
}

- (void)chulishujuBlock:(id)result {
   
    NSArray *arr = [result objectForKey:@"newsList"];
    for (NSDictionary *dic in arr) {
    
        Model *model = [[Model alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arr addObject:model];
    
    }
    NSLog(@"%@", self.arr);
    [self.tableView reloadData];
    
}

- (void)handleData {
    

    handleDataGetByBlock *hanldeBlock = [[handleDataGetByBlock alloc] init];
    hanldeBlock.delegate = self;
    [hanldeBlock handleDataWithString:@"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1"];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return self.arr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    Model *model = [self.arr objectAtIndex:indexPath.row];

    [cell passDataWithModel:model];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

- (void)createTableView {

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
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
