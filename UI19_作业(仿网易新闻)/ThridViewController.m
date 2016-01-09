//
//  ThridViewController.m
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ThridViewController.h"
#import "SecondViewController.h"
#import "CellOfThird.h"
#import "ModelOfFirst.h"
@interface ThridViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, assign) BOOL isGo;
@end

@implementation ThridViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.arr = [NSMutableArray array];
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrayModel.plist"];
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    self.arr = [unarchiver decodeObjectForKey:@"array"];
    [unarchiver finishDecoding];
    
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self handleActionData];
    [self createTableView];
    
    self.navigationItem.title = @"网易";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(buttonItem:)];
    //self.navigationItem.rightBarButtonItem.title = @"编辑";
    
    
}

- (void)buttonItem:(UIBarButtonItem *)item {
    self.isGo = !self.isGo;
    [self.tableView setEditing:self.isGo animated:YES];
}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
//    [super setEditing:editing animated:animated];
//    [self.tableView setEditing:editing animated:YES];
//}


- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UINib *nib = [UINib nibWithNibName:@"CellOfThird" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"pool"];
    
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    NSLog(@"%ld", self.arr.count);
    return self.arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ModelOfFirst *model = [self.arr objectAtIndex:indexPath.row];
    CellOfThird *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    [cell passHandleAction:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ModelOfFirst *model = [self.arr objectAtIndex:indexPath.row];
    SecondViewController *second = [[SecondViewController alloc] init];
    second.url = model.url;
    second.model = model;
    [self.navigationController pushViewController:second animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
