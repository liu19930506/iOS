//
//  ViewController.m
//  UI18_NSURLSession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
@interface ViewController ()<NSURLSessionDelegate, NSURLSessionDataDelegate, NSURLSessionTaskDelegate>

// 用来接收数据.
@property (nonatomic, retain) NSMutableData *data;
@end

@implementation ViewController
#pragma mark - 知识点1 get获取数据, 通过block回调
- (IBAction)handleGETbyBlock:(id)sender {
    // URL
    NSURL *url = [NSURL URLWithString:@"http://mobile.ximalaya.com/m/explore_album_list?category_name=all&condition=hot&device=android&page=1&per_page=20&status=0&tag_name=%E5%8D%81%E4%BA%8C%E6%98%9F%E5%BA%A7"];
    
    // 创建session对象(通道)
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 创建任务(task)
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // block中的参数, 就是从服务器获取的数据.
        NSLog(@"%@", response);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//        });
        
        // data进行解析(JSON格式)
        NSError *errorJson = nil;
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorJson];
        
        NSLog(@"%@", data);
        NSLog(@"%@", result);
        
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", str);
    }];
    
    // 开始任务
    [task resume];
}

#pragma mark - 知识点2 get获取数据, 通过delegate回调
- (IBAction)handleGETbyDelegate:(id)sender {
    
    self.data = [NSMutableData data];
    NSURL *url = [NSURL URLWithString:@"http://mobile.ximalaya.com/m/explore_album_list?category_name=all&condition=hot&device=android&page=1&per_page=20&status=0&tag_name=%E5%8D%81%E4%BA%8C%E6%98%9F%E5%BA%A7"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 添加任务
    NSURLSessionDataTask *task = [session dataTaskWithURL:url];
    
    // 开始任务
    [task resume];
    
}
#pragma mark - 协议方法 NSURLSessionDataDelegate
/** 当从服务器收到响应时, 调用此方法. */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    
    // 此方法不一定需要实现, 但是如果想查看response 可以调用此协议方法
    NSLog(@"%@", response);
    completionHandler(NSURLSessionResponseAllow);
}

/** 当接收数据的时候, 调用此方法. 此方法可能会调用多次. */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
    // 将数据进行拼接
    [self.data appendData:data];
}
/** 当任务完成之后, 调用此方法. */
#pragma mark - 协议方法 NSURLSessionTaskDelegate
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
    // 解析
    NSError *errorOfJSON = nil;
    id result = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:&errorOfJSON];
    NSLog(@"%@", result);
    
}


#pragma mark - 知识点3 POST 获取数据, Block回调
- (IBAction)handlePOSTbyBlock:(id)sender {
    
    // URL
    NSURL *url = [NSURL URLWithString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=15&udid=1234567890&terminalType=Iphone&cid=213"];
    // URLRequest(网络请求对象)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = [@"username=daka&pwd=123" dataUsingEncoding:NSUTF8StringEncoding];
    // session对象(通道)
    NSURLSession *session = [NSURLSession sharedSession];
    // 添加任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        // 解析
        NSError *errorOfJSON = nil;
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorOfJSON];
        NSLog(@"%@", result);
        
    }];
    // 开始任务
    [task resume];
}

#pragma mark - 知识点4 POST 获取数据, 通过delegate回调
- (IBAction)hanldePOSTByDelegate:(id)sender {
    self.data = [NSMutableData data];
    // URL
    NSURL *url = [NSURL URLWithString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=15&udid=1234567890&terminalType=Iphone&cid=213"];
    // URLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"username=daka&pwd=123" dataUsingEncoding:NSUTF8StringEncoding];
    // Session对象(通过)
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    // 添加任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    
    // 开始任务
    [task resume];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
