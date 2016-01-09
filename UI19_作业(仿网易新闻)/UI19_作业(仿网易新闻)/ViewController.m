//
//  ViewController.m
//  UI19_作业(仿网易新闻)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CellOfFirst.h"
#import "CellOfScrollView.h"

#import "NetworkHandler.h"

#import "ModelOfScrollView.h"
#import "ModelOfFirst.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, NetworkHandlerDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrOfScrollView;
@property (nonatomic, retain) NSMutableArray *arrOfFirst;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self handleData];
    [self createNAVITitle];
    [self createTableView];
    
}

- (void)handleData {
    
    NSString *str = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html";
    [NetworkHandler handlerJSONWithURL:str delegate:self];
    
}

- (void)handlerDidComplete:(id)result {
    
    self.arrOfScrollView = [NSMutableArray array];
    self.arrOfFirst = [NSMutableArray array];
    
    NSMutableArray *temp = [NSMutableArray array];
    NSArray *arr = [result objectForKey:@"T1348647853363"];
    for (NSDictionary *dic in arr) {
        [temp addObject:dic];
       
        ModelOfFirst *model = [[ModelOfFirst alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arrOfFirst addObject:model];

    }
   
    NSMutableDictionary *dic = [temp objectAtIndex:0];
   
        NSArray *arrImage = [dic objectForKey:@"ads"];
    
    for (NSDictionary *dic in arrImage) {
        ModelOfScrollView *model = [[ModelOfScrollView alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arrOfScrollView addObject:model];
    }
    
//    for (ModelOfFirst *model in self.arrOfFirst) {
//        NSLog(@"%@", model.url);
//    }
   
    [self.tableView reloadData];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *second = [[SecondViewController alloc] init];
    ModelOfFirst *model = [self.arrOfFirst objectAtIndex:indexPath.row];
    second.url = model.url;
    second.model = model;
    [self.navigationController pushViewController:second animated:YES];
    
}


- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UINib *nib0 = [UINib nibWithNibName:@"CellOfScrollView" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib0 forCellReuseIdentifier:@"pool0"];
    
    UINib *nib1 = [UINib nibWithNibName:@"CellOfFirst" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:@"pool1"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrOfFirst.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 == indexPath.row) {
        CellOfScrollView *cell = [tableView dequeueReusableCellWithIdentifier:@"pool0"];
        
        [cell passHandleData:self.arrOfScrollView];
        
        return cell;
    } else {
        CellOfFirst *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
        ModelOfFirst *model = [self.arrOfFirst objectAtIndex:indexPath.row];
        [cell passHandleData:model];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        return 180;
    }
    return 100;
}




- (void)createNAVITitle {
    
    self.navigationItem.title = @"网易";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-24 (2)"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightBarButtonItemAction:)];
    
}

- (void)leftBarButtonItemAction:(UIBarButtonItem *)item {
    
}

- (void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
