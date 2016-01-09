//
//  SecondViewController.m
//  UI_作业(通讯录)
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "Contact.h"

@interface SecondViewController ()<UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, retain) UITextField *textFieldName;
@property (nonatomic, retain) UITextField *textFieldPhone;
@property (nonatomic, retain) UITextField *textFieldHobby;
@property (nonatomic, retain) UIAlertController *alert;
@property (nonatomic, retain) UIImageView *imageView;



@end

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)dealloc {
    
    [_con release];
    [_imageView release];
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

    [self createSave];
}

- (void)createSave {
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(SaveAction:)] autorelease];
    
}

- (void)SaveAction:(UIBarButtonItem *)item {
    

    self.con = [[Contact alloc] init];
    self.con.name = self.textFieldName.text;
    
    
    self.con.hobby = self.textFieldHobby.text;

    self.con.photoOf = self.imageView.image;
    self.con.photo = nil;
    [self.delegate handData:self.con];
    [self.con release];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)createContactImageView {
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"iconfont-wodedingdan25"];
    [self.view addSubview:self.imageView];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView release];
    self.imageView.frame = CGRectMake(100, 450, self.view.frame.size.width - 200, 175);
    self.imageView.backgroundColor = [UIColor redColor];
    
    
    /** 添加手势 */
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.imageView addGestureRecognizer:tap];
    [tap release];
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"ddd");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"获取照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    /** 判断是否支持相机 */
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        
    }
        UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            /** 相册 */
            UIImagePickerController *imagePiker = [[UIImagePickerController alloc] init];
            imagePiker.delegate = self;
            imagePiker.allowsEditing = YES;
            imagePiker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePiker animated:YES completion:^{}];
            
                
    }];
    UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:alertAction3];
    //[alertAction2 release];
    [alert addAction:alertAction2];
    //[alertAction3 release];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
/** 选择完照片确定调用该方法 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    /** 保存图片到本地, 上传照片到服务器要使用 */
    [self saveImage:image withName:@"avatar.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"avatar.png"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    /** 设置显示图片 */
    [self.imageView setImage:savedImage];
    
}

/** 保存照片到沙盒中 */

- (void)saveImage:(UIImage *)currentImage withName:(NSString *)imageName {
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 1);  //1为不缩放保存, 取值(0.0 - 1)
    
    /** 获取沙盒目录 */
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    /** 将图片写入文件 */
    [imageData writeToFile:fullPath atomically:YES];
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
