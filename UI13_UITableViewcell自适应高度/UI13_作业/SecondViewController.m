//
//  SecondViewController.m
//  UI13_作业
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "CellOfImage.h"
@interface SecondViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *arr;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    [self handleData];
}

- (void)handleData {
    
    self.arr = @[@"20140907223321_zKuEj.thumb.700_0.jpeg", @"1446196324974.jpg", @"1444355366354.jpg", @"122AFAFE-FBBC-43FB-8A44-7E5E1A26689E.jpg"];
    
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[CellOfImage class] forCellReuseIdentifier:@"pool"];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellOfImage *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    [cell passModel:[self.arr objectAtIndex:indexPath.row]];
    
    return cell;
    
    
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *name = [self.arr objectAtIndex:indexPath.row];
    
    return [CellOfImage heightForCellWithName:name];
    
}


#pragma mark - delegate
/** cell将要出现时候调用 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [UIView animateWithDuration:0.8 animations:^{
        
        self.tableView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^{
            
            self.tableView.transform = CGAffineTransformIdentity;
            
        }];
    }];
    
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
