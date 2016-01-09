//
//  ViewController.m
//  UI13_UITableViewcell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ModelOfNews.h"
#import "CellOfNews.h"
#import "SecondViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrModel;
@end


@implementation ViewController

- (void)dealloc {
    
    [_arrModel release];
    
    [_tableView release];
    [super dealloc];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self handleData];
    [self createTableView];
}

- (void)handleData {
    /** 初始化数组. */
    self.arrModel = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"News" ofType:@"txt"];
    
    /** 创建一个数据对象. */
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    /** 取出数组. */
    NSArray *arr = [result objectForKey:@"news"];
    
    /** 遍历数组, 将数组中的字典转换为model. */
    for (NSDictionary *dic in arr) {
        
        ModelOfNews *model = [[ModelOfNews alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arrModel addObject:model];
        [model release];
        
    }
    
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[CellOfNews class] forCellReuseIdentifier:@"pool1"];
   
}

#pragma mark - UITableView DataSource
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView {
    
   
    
    return 1;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
  
    
    return self.arrModel.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellOfNews *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    /** cell赋值. */
    ModelOfNews *model = [self.arrModel objectAtIndex:indexPath.row];
    [cell passModel:model];
    
    
    return cell;
    
}



#pragma mark - UITableView Delegate
/** 返回每行的高度. */
- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ModelOfNews *model = [self.arrModel objectAtIndex:indexPath.row];
    
    /** 通过cell的计算高度方法, 返回高度值. */
   
    return [CellOfNews heightForCell:model];
}

/** 点击cell之后调用此方法. */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
    [second release];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
