//
//  SecondViewController.m
//  UI10_作业
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *label;
@end

//@interface SecondViewController ()
//
//@end

@implementation SecondViewController

- (void)handImageView:(NSDictionary *)dic {
    
    
    self.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    self.label.text = [dic objectForKey:@"name"];
}



- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 300, 400)];
        self.imageView.userInteractionEnabled = YES;
        [self.view addSubview:self.imageView];
        [self.imageView release];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 500, 100, 40)];
        [self.view addSubview:self.label];
        [self.label release];
        self.label.backgroundColor = [UIColor grayColor];
        
    }
    return self;
}


- (void)dealloc {
    
    [_label release];
    [_imageView release];
    [super dealloc];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
