//
//  ViewController.m
//  UI12_UITableView自定义Cell
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellOfContact.h"
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
    
    [self createTableView];
    
    [self handleData];
    
    
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}
#pragma mark - TableView DataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 == indexPath.row) {
        
        /** 创建系统的cell. */
        static NSString *pool = @"reuse";
        
        UITableViewCell *cell = [[UITableView alloc] dequeueReusableCellWithIdentifier:pool];
        
        if (nil == cell) {
            
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pool] autorelease];
            
        }
        
        /** cell赋值. */
        cell.textLabel.text = @"这是系统的cell";
        return cell;
        
    } else {
        
        /** 获取自定义cell.
         *  详见cellOfContact
         */
        
        static NSString *pool2 = @"reuse";
        CellOfContact *cell = [tableView dequeueReusableCellWithIdentifier:pool2];
        if (nil == cell) {
            
            cell = [[[CellOfContact alloc] initWithStyle:0 reuseIdentifier:pool2] autorelease];
            
        }
        
        return cell;
    }
    
  
}

#pragma mark - TableView Delegate
/** 返回每行的高度 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)handleData {
    
    self.arr = [NSMutableArray arrayWithArray:@[@"zhangsan",@"lisi", @"wangwu"]].mutableCopy;
}
#pragma mark-
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
