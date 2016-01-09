//
//  ViewController.m
//  UI11_UITableView编辑(cell的删除_移动_插入)
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@end

@interface ViewController ()

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
    
    [self handArr];
    [self createTableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self tableViewIsEdit];
    
}



#pragma mark - 让TableView进入到编辑状态
- (void)tableViewIsEdit {
    
    /** 利用VC的一个封装方法, 在导航栏上添加一个BarButton. 
     *  当点击此Button时, 调用下边的setEditing:animated:方法.
     */
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    /** 必须先调用父类方法 */
    [super setEditing:editing animated:animated];
    
    /** 让TableView进入/退出编辑状态 */
    [self.tableView setEditing:editing animated:YES];
    
    
}




#pragma mark - tableView DataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *pool = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:pool]autorelease];
    }
    
    cell.textLabel.text = self.arr[indexPath.row];
    
    return cell;
}

#pragma mark ** cell编辑相关的方法

/** 确定哪些行可以进入编辑状态 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 如果想控制某些行进入编辑状态, 使用indexPath参数, 判断具体的行.
     *  
     *  注意: 返回yes可以编辑, 返回no不能编辑
     *  默认(此方法不用实现)是yes: 都可以编辑
     */
    
    return YES;
}

/** 提交点击状态. */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                            forRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 实现删除功能. */
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        
        /** 从数据源删除数据. */
        
        [self.arr removeObjectAtIndex:indexPath.row];
        
        /** tableView删除cell. */
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        
        
    } else if (UITableViewCellEditingStyleInsert == editingStyle) {     //判断是插入状态.
        
        /** 更新数据源. */
        
        [self.arr insertObject:@"张三" atIndex:indexPath.row];
        
        /** tableView插入cell. */
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark ** cell 移动相关的方法.
/** 确定TableView是否可以移动. */
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

/** 移动 */

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    /** 注意: 此方法中不写代码, cell就可以实现移动.
     *  因此, 此方法中的代码主要是更新数据.
     *
     */
    
    NSString *str = [[self.arr objectAtIndex:fromIndexPath.row] retain];;
    /** 对象先从数组中移除掉. */
    
    [self.arr removeObjectAtIndex:fromIndexPath.row];
    
    /** 然后对象再插入数组中. */
    [self.arr insertObject:str atIndex:toIndexPath.row];
    
    [str release];
    
    NSLog(@"%@", self.arr);
}


    


#pragma mark - tableView Delegate
/** 确定每行的编辑风格(删除/添加). */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 需求: 第一行添加, 其余行如下风格. */
    switch (indexPath.row) {
        case 0:
            return 2;   //插入风格
            break;
        case 1:
            return 1|2; //选中风格
            break;
        case 2:
            return 1|2;
            break;
        default:
            return 1;   //删除风格
            break;
    }
    
}



#pragma mark - tabelView创建
- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView release];
}

- (void)handArr {
    self.arr = @[@"zhang", @"li", @"liu", @"zhao"].mutableCopy;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
