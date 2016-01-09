//
//  SecondViewController.m
//  UI14_TableView自定义cell_代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation SecondViewController

- (void)dealloc {
    [_arr release];
    [_tableView release];
    [super dealloc];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTableView];
    [self handleData];
    
}

- (void)handleData {
    self.arr = @[@"zhang", @"li", @"liu", @"zhao"].mutableCopy;
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool"];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
/** ios8 推出的新API, 右侧滑动cell出现附加控件. */
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 创建多个rowAction对象. */
    UITableViewRowAction *actionEdit = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Edit" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        
        [self alertControllerForEdit];
        
    }];
    actionEdit.backgroundColor = [UIColor grayColor];
    
    UITableViewRowAction *actionDele = [UITableViewRowAction rowActionWithStyle:0 title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
       
        
        [self alertControllerWithIndexPath:indexPath];
    }];
    
    return @[actionDele, actionEdit];
}

#pragma mark - alertController
/** UIAlertController, 详见API. */
- (void)alertControllerWithIndexPath:(NSIndexPath *)indexPath {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否删除" preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    /** 添加action. */
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ddd");
        
        /** 取出两个textField内容 */
        NSArray *arr = alert.textFields;
        for (UITextField *tf in arr) {
            NSLog(@"%@", tf);
        }
        
    }];
    
    UIAlertAction *actionDele = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *actionDetail = [UIAlertAction actionWithTitle:@"Delete" style:0 handler:^(UIAlertAction * _Nonnull action) {
        
        [self deleteCell:indexPath];
        
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       
        textField.placeholder = @"请输入用户名";
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.placeholder = @"请输入密码";
        textField.secureTextEntry = YES;
    }];
    
    [alert addAction:actionOk];
    [alert addAction:actionDele];
    [alert addAction:actionDetail];
    
    /** 模态推出 */
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
}

- (void)deleteCell:(NSIndexPath *)indexPath {
    
    /** 数据 */
    [self.arr removeObjectAtIndex:indexPath.row];
    
    /** UI */
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


- (void)alertControllerForEdit {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否编辑" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //添加action
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:0 handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:1 handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:actionOK];
    [alert addAction:actionCancel];
    
    //模态推出
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
