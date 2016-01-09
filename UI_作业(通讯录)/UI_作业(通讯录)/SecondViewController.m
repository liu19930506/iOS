//
//  SecondViewController.m
//  UI_作业(通讯录)
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITextFieldDelegate>

@property (nonatomic, retain) UITextField *textFieldName;
@property (nonatomic, retain) UITextField *textFieldPhone;
@property (nonatomic, retain) UITextField *textFieldHobby;
@property (nonatomic, retain) UIAlertController *alert;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, retain) NSMutableDictionary *dic;

@end

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)dealloc {
    
    [_imageView release];
    [_button release];
    [_textFieldName release];
    [_textFieldPhone release];
    [_textFieldHobby release];
    [super dealloc];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"新建联系人";
    [self createContactName];
    [self createContactPhone];
    [self createContactHobby];
    [self createContactImageView];
    //[self createButton];
    [self createSave];
}

- (void)createSave {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(SaveAction:)];
    
}

- (void)SaveAction:(UIBarButtonItem *)item {
    
    self.dic = [NSMutableDictionary dictionaryWithDictionary:@{@"name" : self.textFieldName.text,
                                                               @"phone" : self.textFieldPhone.text,
                                                               @"hobby" : self.textFieldHobby.text}];
    [self.delegate handData:self.dic];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)createContactImageView {
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"iconfont-wodedingdan25"];
    [self.view addSubview:self.imageView];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView release];
    self.imageView.frame = CGRectMake(100, 350, self.view.frame.size.width - 200, 175);
    
    
    /** 添加手势 */
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.imageView addGestureRecognizer:tap];
    [tap release];
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    
    
    
}

- (void)createAlert {
    
}


- (void)createContactName {
    
    self.textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, self.view.frame.size.width - 200, 40)];
    [self.view addSubview:self.textFieldName];
    [self.textFieldName release];
    self.textFieldName.placeholder = @"请输入姓名";
    
    self.textFieldName.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lianxiren"]];
    self.textFieldName.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldName.borderStyle = UITextBorderStyleRoundedRect;
    
    self.textFieldName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    
    self.textFieldName.delegate = self;
    
}

- (void)createContactPhone {
    
    self.textFieldPhone = [[UITextField alloc] initWithFrame:CGRectMake(100, 180, self.view.frame.size.width - 200, 40)];
    [self.view addSubview:self.textFieldPhone];
    [self.textFieldPhone release];
    self.textFieldPhone.placeholder = @"请输入手机号";
    
    self.textFieldPhone.keyboardType = UIKeyboardTypePhonePad;
    self.textFieldPhone.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dianhua"]];
    self.textFieldPhone.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldPhone.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldPhone.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.textFieldPhone.delegate = self;
}

- (void)createContactHobby {
    
    self.textFieldHobby = [[UITextField alloc] initWithFrame:CGRectMake(100, 260, self.view.frame.size.width - 200, 40)];
    [self.view addSubview:self.textFieldHobby];
    [self.textFieldHobby release];
    self.textFieldHobby.placeholder = @"爱好";
    
    self.textFieldHobby.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aihao"]];
    self.textFieldHobby.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldHobby.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldHobby.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.textFieldHobby.delegate = self;
    
}

- (void)createButton {
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.button];
    self.button.frame = CGRectMake(100, 350, self.view.frame.size.width / 4, 40);
    self.button.backgroundColor = [UIColor whiteColor];
    self.button.layer.cornerRadius = 8;
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)ButtonAction:(UIButton *)button {
    
    self.dic = [NSMutableDictionary dictionaryWithDictionary:@{@"name" : self.textFieldName.text,
                                                               @"phone" : self.textFieldPhone.text,
                                                               @"hobby" : self.textFieldHobby.text}];
    [self.delegate handData:self.dic];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
    
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
