//
//  ViewController.m
//  UI20_本地存储(文件形式)
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ModelForPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 知识点1 APP包路径

- (IBAction)findAPPPath:(id)sender {
    
    // NSBundle 类
    
    // 获取APP包路径
    NSString *appPath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"%@", appPath);
    
    // 获取APP包中的某一个资源路径.
    NSString *resPath = [[NSBundle mainBundle] pathForResource:@"122AFAFE-FBBC-43FB-8A44-7E5E1A26689E" ofType:@"jpg"];
    NSLog(@"%@", resPath);
}


#pragma mark - 知识点2 沙盒路径
- (IBAction)findSandBoxPath:(id)sender {
    
    // API:NSHomeDirectory()
    NSString *sandBoxPath = NSHomeDirectory();
    NSLog(@"%@", sandBoxPath);
}

#pragma mark - 知识点3 利用API快速获取沙盒中各文件夹路径.
- (IBAction)findPath:(id)sender {
    
    // API: NSSearchPathForDirectoriesInDomains
    
    /** 
     *  @brief 获取沙盒中Document文件夹路径.
     *  
     *  @param directory 要查找的目录名(文件夹)
     *  @param domainMask 在哪个domain中查找参数一的目录名
     *  @param expandTilde 是否展开 ~ (绝对路径(域))
     *
     *  @return NSArray<NSString *> 将查找出来的目录路径放到一个数组中返回(因为可能会有多个同名的目录)
     */
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, NO) lastObject];
    NSLog(@"%@", docPath);
    // 获取Caches(缓存文件夹)路径
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", caches);
    
    // 获取tmp(临时文件夹)路径
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@", tmpPath);
    
    // 获取Library(资源库)路径
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", libraryPath);
    
    // 获取Preferences文件夹路径(拼接而成)
    NSString *prePath = [libraryPath stringByAppendingString:@"/Preferences"];
    NSLog(@"%@", prePath);
    
    // 此方法在拼接路径时常用. 
    NSString *perPath2 = [libraryPath stringByAppendingPathComponent:@"Preferences"];
    NSLog(@"%@", perPath2);
}

#pragma mark - 知识点4 简单对象读写到本地

#pragma mark ** NSString对象.
- (IBAction)hanleNSStringWriteToDisk:(id)sender {
    
    NSLog(@"%@", NSHomeDirectory());
    
    // 要保存的字符串对象.
    NSString *str = @"iphone6";
    
    // 文件保存路径.
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *file = [docPath stringByAppendingPathComponent:@"name.txt"];
    
    // 写入disk.
    [str writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}
- (IBAction)handleNSStringReadFromDisk:(id)sender {
    
    // 文件所在的路径.
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"name.txt"];
    
    // 生成NSString对象.
    NSString *readStr = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@", readStr);
}

#pragma mark ** NSArray
- (IBAction)handleArrayWriteToDisk:(id)sender {
    NSArray *arr = @[@"zhang", @"li", @"liu"];
    
    NSLog(@"%@", NSHomeDirectory());
    
    // 创建文件保存路径
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"array.plist"];
    
    // 写入
    [arr writeToFile:file atomically:YES];
    
    
}
- (IBAction)handleNSArrayReadFromDisk:(id)sender {
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"array.plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:file];
    NSLog(@"%@", arr);
    
}

#pragma mark ** NSDictionary对象
- (IBAction)handleNSDictionaryWriteToDisk:(id)sender {
    
    
    NSDictionary *dic = @{@"name":@"zhang"};
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"dic.plist"];
    [dic writeToFile:file atomically:YES];
    
}

- (IBAction)handleNSDictionaryWriteFromDisk:(id)sender {
    
    NSLog(@"%@", NSHomeDirectory());
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"dic.plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:file];
    NSLog(@"%@", dic);
}

#pragma mark ** NSData对象
- (IBAction)handleNSDataWriteToDisk:(id)sender {
    
    // 要存储的Data
    UIImage *image = [UIImage imageNamed:@"122AFAFE-FBBC-43FB-8A44-7E5E1A26689E.jpg"];
    NSData *data = UIImageJPEGRepresentation(image, 1);
    
    // 路径
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"1.jpg"];
    [data writeToFile:file atomically:YES];
    
}


- (IBAction)handleNSDataWriteFromDisk:(id)sender {
    
    // 路径.
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"1.da"];
    
    NSData *data = [NSData dataWithContentsOfFile:file];
    
    // image对象
    UIImage *image = [UIImage imageWithData:data];
    UIImage *image2 = [UIImage imageWithContentsOfFile:file];
    NSLog(@"%@", image);
    NSLog(@"%@", image2);
    
}

#pragma mark - 知识点5 复杂对象读写本地
- (IBAction)handleModelWriteToDisk:(id)sender {
    
    // 要归档的model对象.(!!! 要归档的model类一定要实现NSCoding两个协议方法)
    ModelForPerson *per = [[ModelForPerson alloc] init];
    per.name = @"zhangsan";
    per.sex = @"male";
    
    // 创建归档时所需的Data对象.
    NSMutableData *data = [NSMutableData data];
    
    // 归档类.
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    // 开始归档.
    [archiver encodeObject:per forKey:@"per"];
    
    // 归档结束.
    [archiver finishEncoding];
    
    // data写入本地
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"model.da"];
    
    [data writeToFile:file atomically:YES];
    
    
    
}

- (IBAction)handleModelWriteFromDisk:(id)sender {
    // data路径
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"model.da"];
    // data
    NSData *data = [NSData dataWithContentsOfFile:file];
    
    // 反归档类
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    // 开始反归档
    ModelForPerson *per = [unarchiver decodeObjectForKey:@"per"];
    
    // 反归档结束
    [unarchiver finishDecoding];
    
    NSLog(@"%@ , %@", per.name, per.sex);
}

#pragma mark - 知识点6 NSFileManager 类
#pragma mark - 知识点7 NSFileHandle 类

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
