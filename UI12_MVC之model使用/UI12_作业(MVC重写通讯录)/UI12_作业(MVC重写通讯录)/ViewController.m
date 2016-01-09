//
//  ViewController.m
//  UI12_作业(MVC重写通讯录)
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "CellOfContact.h"
#import "ThirdViewController.h"
#import "SecondViewController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate,SecondViewControllerDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrKey;
@property (nonatomic, retain) NSMutableDictionary *dicContact;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, retain) NSMutableArray *arrDeleteContact;
@property (nonatomic, retain) NSMutableArray *arrKeyDelete;
@end

@implementation ViewController

- (void)dealloc {
    
    [_arrKeyDelete release];
    [_arrDeleteContact release];
    [_arrKey release];
    [_dicContact release];
    [_tableView release];
    [super dealloc];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"通讯录";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.arrKeyDelete = [NSMutableArray array];
    self.arrDeleteContact = [NSMutableArray array];
    [self createTableView];
    [self handleData];
    [self createDeleteButton];
}

#pragma mark - 删除多个数据按钮创建
- (void)createDeleteButton {
    if (self.flag) {
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteButton:)] autorelease];
    } else {
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftBarButtonAction:)] autorelease];
    }
}

- (void)deleteButton:(UIBarButtonItem *)button {
    

    if (self.arrDeleteContact.count) {
        for (NSString *key in self.arrKeyDelete) {
            
            NSMutableArray *arr = [self.dicContact objectForKey:key];
            [arr removeObjectsInArray:self.arrDeleteContact];
            
            if (!arr.count) {
                [self.arrKey removeObject:key];
            }
        }
    }
    
    [self.tableView reloadData];
    [self.arrKeyDelete removeAllObjects];
    [self.arrDeleteContact removeAllObjects];
    
  
    
}

/** 编辑时: 取消选定 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];
    [self.arrKeyDelete removeObject:key];
    NSMutableArray *arr = [self.dicContact objectForKey:key];
    Contact *con = [arr objectAtIndex:indexPath.row];
    [self.arrDeleteContact removeObject:con];
    NSLog(@"%@", self.arrKeyDelete);
    NSLog(@"%@", self.arrDeleteContact);
}

- (void)handData:(Contact *)con {
    
   
    
    if ([con.name isEqualToString:@""]) {   //新建联系人是空格开头
        
        NSString *name = [NSString stringWithFormat:@" "];
        if ([self.arrKey containsObject:name]) {
            NSMutableArray *arr = [self.dicContact objectForKey:name];
            [arr addObject:con];
        } else {
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObject:con];
            [self.dicContact setObject:arr forKey:name];
            [self.arrKey addObject:name];
        }
        
    } else {    //不为空
        
        /** 汉字转拼音 */
        NSMutableString *name = [NSMutableString stringWithString:con.name];
        CFStringTransform((CFMutableStringRef)name, nil, kCFStringTransformMandarinLatin, NO);
        CFStringTransform((CFMutableStringRef)name, nil, kCFStringTransformStripDiacritics, NO);
        
        
        /** 判断新建联系人的分组是否存在 */
        NSString *key = [[name substringToIndex:1] capitalizedString];

        if ([self.arrKey containsObject:key]) {     //分组存在
           
            NSMutableArray *arr = [self.dicContact objectForKey:key];
            [arr addObject:con];
        } else {    //分组不存在
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObject:con];
            [self.dicContact setObject:arr forKey:key];
            [self.arrKey addObject:key];
            
        }
        [self.arrKey sortUsingSelector:@selector(compare:)];
    }
    
    
}

- (void)leftBarButtonAction:(UIBarButtonItem *)item {
    
    SecondViewController *second = [[SecondViewController alloc] init];
    second.delegate = self;
    [self.navigationController pushViewController:second animated:YES];
    [second release];
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    self.flag = editing;
    [self createDeleteButton];
    
}

#pragma mark - 加载数据
- (void)handleData {
    
    /** 初始化 */
    self.dicContact = [NSMutableDictionary dictionary];
    
    /** 路径 */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    NSMutableDictionary *dicTemp = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    /** 遍历找到小字典 */
    for (NSString *key in dicTemp) {
        
        NSMutableArray *mArr = [NSMutableArray array];
        
        NSArray *arr = [NSArray arrayWithArray:[dicTemp objectForKey:key]];
        
        for (NSDictionary *dic in arr) {
            Contact *con = [[Contact alloc] init];
            [con setValuesForKeysWithDictionary:dic];
            [mArr addObject:con];
            [con release];
        }
        
        [self.dicContact setValue:mArr forKey:key];
        
    }
    self.arrKey = [NSMutableArray arrayWithArray:self.dicContact.allKeys];
    
    [self.arrKey sortUsingSelector:@selector(compare:)];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    /** 注意: 此方法中不写代码, cell就可以实现移动.
     *  因此, 此方法中的代码主要是更新数据.
     *
     */
 
    NSString *key = [self.arrKey objectAtIndex:fromIndexPath.section];
    NSMutableArray *arr = [self.dicContact objectForKey:key];
    Contact *con = [[arr objectAtIndex:fromIndexPath.row] retain];
    /** 对象先从数组中移除掉. */
    [arr removeObjectAtIndex:fromIndexPath.row];
    
    /** 然后对象再插入数组中. */
    [arr insertObject:con atIndex:toIndexPath.row];
 
}

#pragma mark - TableView Delegate

/** 限制移动 */
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    NSString *key_source = [self.arrKey objectAtIndex:sourceIndexPath.section];
    NSString *key_proposed = [self.arrKey objectAtIndex:proposedDestinationIndexPath.section];
    
    if ([key_source isEqualToString:key_proposed]) {
        NSMutableArray *arr = [self.dicContact objectForKey:key_proposed];
        Contact *con = [[arr objectAtIndex:sourceIndexPath.row] retain];
        [arr removeObjectAtIndex:sourceIndexPath.row];
        [arr insertObject:con atIndex:proposedDestinationIndexPath.row];
        return proposedDestinationIndexPath;
        
    } else {
        return sourceIndexPath;
    }
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
}

/** 将要显示的cell */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", cell);
    [UIView animateWithDuration:0.25 animations:^{
        
        // 执行的动画code
        

    }];
}

#pragma mark - 题头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.arrKey objectAtIndex:section];
    
}

#pragma mark - 点击row时跳转到第三界面(详细信息)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.flag) {
        ThirdViewController *third = [[ThirdViewController alloc] init];
        
        NSString *key = [self.arrKey objectAtIndex:indexPath.section];
        NSArray *arr = [self.dicContact objectForKey:key];
        Contact *con = [arr objectAtIndex:indexPath.row];
        /** 属性传值 */
        third.con = con;
        [self.navigationController pushViewController:third animated:YES];
        [third release];
    }
   
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];

    [self.arrKeyDelete addObject:key];
    NSArray *arr = [self.dicContact objectForKey:key];
    Contact *con = [arr objectAtIndex:indexPath.row];
    [self.arrDeleteContact addObject:con];

}

#pragma mark - 区的个数
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrKey.count;
}

#pragma mark - 创建TableView对象
- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    /** 注册重用池 */
    [self.tableView registerClass:[CellOfContact class] forCellReuseIdentifier:@"pool1"];
}


#pragma mark - TableView DataSource

#pragma mark - 设置右侧索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.arrKey;
}
#pragma mark - 行数
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [[self.dicContact objectForKey:[self.arrKey objectAtIndex:section]] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

#pragma mark - 加载cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellOfContact *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];
    NSArray *arr = [self.dicContact objectForKey:key];
    Contact *con = [arr objectAtIndex:indexPath.row];
    [cell passModel:con];
    return cell;
}

#pragma mark - 提交点击状态
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPat{
    
    /** 一个个删除 */
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        
        /** 从数据源删除 */
        NSString *key = [self.arrKey objectAtIndex:indexPat.section];
        
        NSMutableArray *arr = [self.dicContact objectForKey:key];
        
        [arr removeObjectAtIndex:indexPat.row];
        
        /** 删除cell */
        [tableView deleteRowsAtIndexPaths:@[indexPat] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        /** 如果行数为0, 则要把区的题头也删除掉 */
        if (!arr.count) {
            [self.arrKey removeObjectAtIndex:indexPat.section];
            NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:indexPat.section];
            [tableView deleteSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
            [set release];
        }
    }
    
    

}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    
}

#pragma mark - 我是分割线
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
