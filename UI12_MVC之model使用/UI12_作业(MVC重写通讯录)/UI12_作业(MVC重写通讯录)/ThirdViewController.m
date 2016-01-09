//
//  ThirdViewController.m
//  UI_作业(通讯录)
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ThirdViewController.h"
#import "Contact.h"
@interface ThirdViewController ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *labelName;
@property (nonatomic, retain) UILabel *labelPhone;
@property (nonatomic, retain) UILabel *labelOfHobby;


@end

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)dealloc {
    [_imageView release];
    [_labelName release];
    [_labelPhone release];
    [_labelOfHobby release];
    [_con release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"详细信息";
    [self createContact];
    
}



- (void)createContact {
    
    if (self.con.photo == nil) {
        
        self.imageView = [[UIImageView alloc] initWithImage:self.con.photoOf];
        
        
    } else {
        
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.con.photo]];
    }
    
    [self.view addSubview:self.imageView];
    [self.imageView release];
    self.imageView.backgroundColor = [UIColor grayColor];
    self.imageView.layer.cornerRadius = 20;
    self.imageView.clipsToBounds = YES;
    self.imageView.userInteractionEnabled = YES;
    self.imageView.frame = CGRectMake(50, 150, self.view.frame.size.width - 100, self.view.frame.size.height / 3);
    
    
    self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(50, 400, 100, 50)];
    self.labelName.text = self.con.name;
    self.labelName.textAlignment = 1;
    [self.view addSubview:self.labelName];
    [self.labelName release];
    self.labelName.layer.cornerRadius = 10;
    self.labelName.clipsToBounds = YES;
    self.labelName.backgroundColor = [UIColor whiteColor];
    self.labelName.alpha = 0.5;
    
    self.labelPhone = [[UILabel alloc] initWithFrame:CGRectMake(200, 400, 150, 50)];
    [self.view addSubview:self.labelPhone];
    [self.labelPhone release];
    self.labelPhone.text = self.con.phone;
    self.labelPhone.textAlignment = 1;
    self.labelPhone.layer.cornerRadius = 10;
    self.labelPhone.clipsToBounds = YES;
    self.labelPhone.backgroundColor = [UIColor whiteColor];
    self.labelPhone.alpha = 0.5;
    
    self.labelOfHobby = [[UILabel alloc] initWithFrame:CGRectMake(200, 500, 150, 50)];
    [self.view addSubview:self.labelOfHobby];
    [self.labelOfHobby release];
    self.labelOfHobby.text = self.con.hobby;
    self.labelOfHobby.textAlignment = 1;
    self.labelOfHobby.layer.cornerRadius = 10;
    self.labelOfHobby.clipsToBounds = YES;
    self.labelOfHobby.backgroundColor = [UIColor whiteColor];
    self.labelOfHobby.alpha = 0.5;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
