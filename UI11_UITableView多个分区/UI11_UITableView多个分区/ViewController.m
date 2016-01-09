//
//  ViewController.m
//  UI11_UITableView多个分区
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableDictionary *dicContact;
@property (nonatomic, retain) NSMutableArray *arrKey;
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc {
    
    [_arrKey release];
    [_dicContact release];
    [_tableView release];
    [super dealloc];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createTableView];
    
    //[self handleData];
    
    [self handleDataFromPlist];
    
}

- (void)handleData {
    
    self.dicContact = @{
                        @"Z" : @[@{@"name" : @"zhangsan", @"phone" : @"666666"},
                                 @{@"name" : @"zhaosi", @"phone" : @"555555"},
                                 @{@"name" : @"zhaoliu", @"phone" : @"444444"}],
                        
                        @"L" : @[@{@"name" : @"leifeng", @"phone" : @"888888"}],
                        
                        @"Y" : @[@{@"name" : @"yuyang", @"phone" : @"123321"},
                                 @{@"name" : @"yuan", @"phone" : @"999999"}]
               
                        }.mutableCopy;
    
    /** 将字典中的所有key取出来, 并且排序. */
//    self.arrKey = [[self.dicContact allKeys] sortedArrayUsingSelector:@selector(compare:)].mutableCopy;
    self.arrKey = [NSMutableArray arrayWithArray:[self.dicContact allKeys]];
    [self.arrKey sortUsingSelector:@selector(compare:)];
}


- (void)handleDataFromPlist {
    
    
    /** 创建plist文件. */
    
    /** 将plist文件转换为字典. */
    
    /** 找出plist文件的路径. */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    
    /** 生成字典. */
    self.dicContact = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    self.arrKey = [NSMutableArray arrayWithArray:[self.dicContact allKeys]];
    [self.arrKey sortUsingSelector:@selector(compare:)];
}

#pragma mark - tableView
- (void)createTableView {
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

#pragma mark - tableView DataSource

/** 设置分区数. */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.arrKey.count;
}

/** 每个分区的区头标题. */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    return [self.arrKey objectAtIndex:section];
    
}

/** 每个分区的行数. */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    /** 从arrKey中取出key. */
    
    NSString *key = [self.arrKey objectAtIndex:section];
    
    /** 根据key从字典中获取数组 */
    NSArray *arr = [self.dicContact objectForKey:key];
    
    /** 返回arr的个数 */
    return arr.count;

}

/** 每行的cell. */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *pool = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool];
    if (nil == cell) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:pool] autorelease];
        
    }
    
    
    /** cell的赋值. */
    
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];
    NSArray *arr = [self.dicContact objectForKey:key];
    /** 每个联系人的字典 */
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"name"];
    
    
    return cell;
    
    
}

/** 右侧索引部分. */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.arrKey;
}


#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
