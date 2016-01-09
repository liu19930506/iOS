//
//  ViewController.m
//  UI12_MVC之model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "CellOfContact.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrKey;
@property (nonatomic, retain) NSMutableDictionary *dicContact;
@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [_arrKey release];
    [_dicContact release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleData];
    [self tableViewSubview];
}

//- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}

- (void)handleData {
    
    /** 初始化. */
    self.dicContact = [NSMutableDictionary dictionary];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    NSMutableDictionary *dicTemp = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    /** 遍历dicTemp字典, 将数据转成model对象. */
    for (NSString *key in dicTemp) {
        
        NSArray *arr = [dicTemp objectForKey:key];
        
        /** 初始化一个数组, 用来存放model对象. */
        NSMutableArray *mArr = [NSMutableArray array];
        
        /** 遍历数组. */
        for (NSDictionary *dicCon in arr) {
            
            Contact *cont = [[Contact alloc] init];
            
            /** KVC 方法. 注意: 对于未识别到的key的处理. */
            [cont setValuesForKeysWithDictionary:dicCon];
            
            [mArr addObject:cont];
            [cont release];
            
        }
        [self.dicContact setObject:mArr forKey:key];
        
    }
    self.arrKey = [NSMutableArray arrayWithArray:[self.dicContact allKeys]];
    
    [self.arrKey sortUsingSelector:@selector(compare:)];
    
}

- (void)tableViewSubview {
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    /** 注册cell. */
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];
    [self.tableView registerClass:[CellOfContact class] forCellReuseIdentifier:@"pool2"];
}

#pragma mark - tableView DataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.arrKey objectAtIndex:section];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.arrKey.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *key = [self.arrKey objectAtIndex:section];
    
    return [[self.dicContact objectForKey:key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 返回cell的第二种写法(推荐). 
     *  1. tableView 注册一个Cell类. 绑定一个重用池.
     *  2. 从重用池中直接取cell, 如果cell为空, 系统会自动根据和重用池绑定的Cell类创建cell对象.
     */
    
    if (0 == indexPath.section) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
        
        /** cell赋值. */
        NSString *key =  [self.arrKey objectAtIndex:indexPath.section];
        NSArray *arr = [self.dicContact objectForKey:key];
        Contact *con = [arr objectAtIndex:indexPath.row];
        
        cell.imageView.image = [UIImage imageNamed:con.photo];
        cell.textLabel.text = con.name;
        
        return cell;
    } else {
        
        CellOfContact *cell = [tableView dequeueReusableCellWithIdentifier:@"pool2"];
        
        NSString *key = [self.arrKey objectAtIndex:indexPath.section];
        NSArray *arr = [self.dicContact objectForKey:key];
        
        Contact *cont = [arr objectAtIndex:indexPath.row];
        //cell.imageViewLeft.image = [UIImage imageNamed:cont.photo];
        //cell.labelName.text = cont.name;
        
        /** cell赋值. 
         *  思路: 将model数据传入自定义cell中, 在cell类里面完成cell上子控件的赋值过程.
         */
        
        /** MRC下可以重写setter方法, 但不适用ARC */
//        cell.con = cont;
        
        /** ARC下, 可以通过方法实现. MRC同样适用. */
        [cell passModel:cont];
        
        
        return cell;
    }
    
    
    
}



#pragma mark - tableView Delegate

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
