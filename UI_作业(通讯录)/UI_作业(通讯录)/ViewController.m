//
//  ViewController.m
//  UI_作业(通讯录)
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableDictionary *dicContact;
@property (nonatomic, retain) NSMutableArray *arrKey;
@property (nonatomic, retain) NSArray *arrZimu;

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc {
    
    [_arrZimu release];
    [_arrKey release];
    [_dicContact release];
    [_tableView release];
    [super dealloc];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationItem.title = @"通讯录";
    self.arrZimu = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    [self createTableView];
    [self createAddContact];
    [self TableViewIsEdit];
    [self handleDataFromPlist];
    
}

#pragma mark - 下载数据

- (void)handleDataFromPlist {
    
    /** 根据路径下载 */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    self.dicContact = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    /** 得到数据个数(section值) */
    self.arrKey = [NSMutableArray arrayWithArray:[self.dicContact allKeys]];
    [self.arrKey sortUsingSelector:@selector(compare:)];
    
}

#pragma mark - 创建添加联系人按钮

- (void)createAddContact {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(AddContact:)];
}

#pragma mark - 推入第二界面
- (void)AddContact:(UIBarButtonItem *)item {
  
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
    [second release];
    
    second.delegate = self;
    
}

#pragma mark - 创建联系人返回第一界面协议方法
- (void)handData:(NSDictionary *)dic {
    
    
    if (!([dic objectForKey:@"name"] != nil)) {
        
        /** 汉字转拼音 */
        NSMutableString *name = [[NSMutableString alloc] initWithString:[dic objectForKey:@"name"]];
        CFStringTransform((CFMutableStringRef)name, nil, kCFStringTransformMandarinLatin, NO);
        CFStringTransform((CFMutableStringRef)name, nil, kCFStringTransformStripDiacritics, NO);
        
        /** 获取新建联系人的开头字母 */
        NSString *key = [[name capitalizedString] substringToIndex:1];
        
        /** 判断新建联系人是否有存在的分区组 */
        if ([self.arrKey containsObject:key] ) {
            
            NSMutableArray *arr = [self.dicContact objectForKey:key];
            [arr addObject:dic];
            
        }
        else {        //不存在分组时要创建分组
            /** 创建索引和区的题头 */
            [self.arrKey addObject:key];
            NSMutableArray *arr2 = [NSMutableArray array];
            [arr2 addObject:dic];
            
            [self.dicContact setObject:arr2 forKey:key];
            
            
            
        }
        [self.arrKey sortUsingSelector:@selector(compare:)];
        

        
    } else {
        NSMutableString *name = [NSMutableString stringWithFormat:@" "];
        /** 判断新建联系人是否有存在的分区组 */
        if ([self.arrKey containsObject:name] ) {
            
            NSMutableArray *arr = [self.dicContact objectForKey:name];
            [arr addObject:dic];
            
        }
        else {        //不存在分组时要创建分组
            /** 创建索引和区的题头 */
            [self.arrKey addObject:name];
            NSMutableArray *arr2 = [NSMutableArray array];
            [arr2 addObject:dic];
            
            [self.dicContact setObject:arr2 forKey:name];
            
            
            
        }
        [self.arrKey sortUsingSelector:@selector(compare:)];
    }
    
    
    
}

#pragma mark - 创建TableView的cell(row)DataSource(1/2)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    /** 取出数组中的key值 */
    NSString *key = [self.arrKey objectAtIndex:section];
    /** 根据key值从字典中找到所对应的数组 */
    NSArray *arr = [self.dicContact objectForKey:key];
    return arr.count;
}

#pragma mark - 创建TableView的cell(row)DataSource(2/2)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *pool = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool];
    if (nil == cell) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:pool] autorelease];
        
    }
    
    /** 得到key值 */
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];
    
    /** 根据key值从字典中得到对应的分组 */
    NSMutableArray *arr = [self.dicContact objectForKey:key];
    
    /** 根据row值从分组中找到对应的小字典 */
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"name"];

    return cell;
}

#pragma mark - 创建TableView的cell(section)DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.arrKey.count;
}

#pragma mark - 设置每个区的题头(DataSource)
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.arrKey objectAtIndex:section];
}

#pragma mark - 设置右侧索引(DataSource)
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.arrKey;
}

#pragma mark - 提交点击状态(DataSource)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
 {
    
    /** 实现删除功能 */
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        
        /** 从数据源删除 */
        
        /** 找到对应的key */
        NSString *key = [self.arrKey objectAtIndex:indexPath.section];
        
        /** 根据key值找到对应的数组 */
        NSMutableArray *mArr = [self.dicContact objectForKey:key];
        
        /** 从数组中删除对应的小字典 */
        [mArr removeObjectAtIndex:indexPath.row];
        
        /** 删除cell */
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
      //  [tableView reloadData];
  
        if (!mArr.count) {
            [self.dicContact removeObjectForKey:key];
            [self.arrKey removeObjectAtIndex:indexPath.section];
            
            NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:indexPath.section];
            [tableView deleteSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
            
           // [tableView reloadData];
        }
    }
     
}

#pragma mark - 选中path跳转到第三界面(Delegate)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ThirdViewController *third = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:third animated:YES];
    [third release];
    
    /** 得到key值 */
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];
    
    
    /** 根据key值从字典中得到对应的分组 */
    
    NSArray *arr = [self.dicContact objectForKey:key];
    
    /** 根据row值从分组中找到对应的小字典 */
    
    NSMutableDictionary *dic = [arr objectAtIndex:indexPath.row];
    
    third.dic = dic;
    
   
}

#pragma mark - 创建TableView
- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
  
}

#pragma mark - 让TableView可以进入编辑模式
- (void)TableViewIsEdit {
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    /** 调用父类方法 */
    [super setEditing:editing animated:animated];
    /** 编辑TableView */
    [self.tableView setEditing:editing animated:YES];
}

#pragma mark - 确定TableView的编辑风格
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

#pragma mark - 返回第一界面时刷新
- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    
    
}

#pragma mark - 我是分割线
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
