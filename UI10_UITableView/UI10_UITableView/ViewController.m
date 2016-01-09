//
//  ViewController.m
//  UI10_UITableView
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
/** 声明一个数组属性, 用来存放数据 */
@property (nonatomic, retain) NSMutableArray *arrData;
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc {
    [_arrData release];
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    [self handleData];
    
    [self createTableView];
    
}

#pragma mark - 知识点1: UITableView
- (void)createTableView {
    
    /** 创建对象. 
     *  参数2: 指定风格, 有两种风格(普通, 分组).
     */
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    /** 重点: tableView大部分的功能是通过Delegate设计模式实现的, 即代理人通知
     *  tableView如何做...
     */
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    /** tableView的一些API */
    
    /** 全局cell的高度(row), 对所有cell起作用. */
    self.tableView.rowHeight = 100;
    
    /** 分割线样式 */
    self.tableView.separatorStyle = 1;
    
    /** 分割线颜色 */
    self.tableView.separatorColor = [UIColor redColor];
}

- (void)handleData {
    
    /** 数组中都是字符串对象. */
//    self.arrData = @[@"娜美",@"罗宾",@"香吉士",@"索隆",@"汉库克",@"布鲁克",@"佩罗娜",@"香阁斯",@"艾斯",@"小丑巴基",@"桔梗",@"莫利亚",@"乔巴",@"弗兰克"].mutableCopy;
    
    /** 数组中都是字典对象 */
    self.arrData = @[
                     
                     @{@"title" :@"娜美",
                       @"detail":@"aaa",
                       @"image" :@"1"},
                     @{@"title" :@"罗宾",
                       @"detail":@"bbb",
                       @"image" :@"2"},
                     @{@"title" :@"索隆",
                       @"detail":@"ccc",
                       @"image" :@"3"},
                     @{@"title" :@"艾斯",
                       @"detail":@"ddd",
                       @"image" :@"4"},
                     @{@"title" :@"乔巴",
                       @"detail":@"eee",
                       @"image" :@"5"},
                     @{@"title" :@"弗兰克",
                       @"detail":@"fff",
                       @"image" :@"6"},
            
                     
                     ].mutableCopy;
}

#pragma mark - tableView DataSource

/** 必须实现的协议方法(1/2) */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrData.count;
}

/** 必须实现的协议方法(2/2) */
#pragma mark - UITableViewCell重用池机制
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%ld, %ld", indexPath.section, indexPath.row);
    
    /** static 修饰的变量, 只初始化一次.
     *  在静态区开辟空间, 程序结束, 内存才释放.
     */
    static NSString *pool1 = @"reuse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool1];
    
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:pool1]autorelease];
    }
    
    
    /** cell进行赋值. 
     *
     *  系统封装好的cell只有三个预编译控件可以赋值(textLabel, detailTextLabel, imageView)
     *
     *  系统的cell有所谓的4种风格(style), 实际上就是上面三个控件的不同组合.
     */
    
    /** 取出数组中相应的字典 */
    NSDictionary *dic = [self.arrData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"title"];
    
    cell.detailTextLabel.text= [dic objectForKey:@"detail"];
    
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    
    /** cell 最右边的辅助区域 */
    cell.accessoryType = 1;
    

    
    /** 返回cell. */
    return cell;
    
}

#pragma mark - tableView Delegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ddd, %ld, %ld", indexPath.section, indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
