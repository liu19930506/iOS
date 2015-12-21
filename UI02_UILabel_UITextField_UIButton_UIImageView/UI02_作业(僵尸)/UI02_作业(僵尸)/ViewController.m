//
//  ViewController.m
//  UI02_作业(僵尸)
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) NSMutableArray *arrAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark - 添加背景
    self.imageViewBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackGround"]];
    self.imageViewBack.frame = self.view.frame;
    [self.view addSubview:self.imageViewBack];
    [_imageViewBack release];
    
    
#pragma mark - 僵尸imageView
    
    
    [self addZombie];
    [self addGua];
    [self addHua];
    
    [self addBZombie2];
    [self addBZombie];
    [self addPlants];
}

#pragma mark - 花数组

- (void)addHua {
    
    UIImageView *imageView_hua = [[UIImageView alloc] initWithFrame:CGRectMake(50, 520, 100, 100)];
    [self.imageViewBack addSubview:imageView_hua];
    [imageView_hua release];
    
    NSMutableArray *temp = [NSMutableArray array];
    
    for (int i = 1; i < 19; i++) {
        
        NSString *name = [NSString stringWithFormat:@"flower%d.tiff", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [temp addObject: image];
        [image release];
        
    }
    imageView_hua.animationImages = temp;
    imageView_hua.animationDuration = 0.05;
    imageView_hua.animationRepeatCount = 0;
    [imageView_hua startAnimating];
    
    
}




#pragma mark - 瓜数组

- (void)addGua {
    
    UIImageView *imageView_gua = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
    [self.imageViewBack addSubview:imageView_gua];
    [imageView_gua release];
    
    NSMutableArray *temp = [NSMutableArray array];
    
    for (int i = 1; i < 17; i++) {
        
        NSString *name = [NSString stringWithFormat:@"gua%d.tiff", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [temp addObject: image];
        [image release];
        
    }
    imageView_gua.animationImages = temp;
    imageView_gua.animationDuration = 0.02;
    imageView_gua.animationRepeatCount = 0;
    [imageView_gua startAnimating];
    
}

#pragma mark - 豌豆数组
- (void)addPlants {
    UIImageView *imageView_plants = [[UIImageView alloc] initWithFrame:CGRectMake(50, 80, 100, 100)];
    [self.imageViewBack addSubview:imageView_plants];
    [imageView_plants release];
    
    NSMutableArray *temp = [NSMutableArray array];
    
    for (int i = 1; i < 10; i++) {
        
        NSString *name = [NSString stringWithFormat:@"plants%d.tiff", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [temp addObject:image];
        [image release];
        
    }
    
    imageView_plants.animationImages = temp;
    imageView_plants.animationDuration = 1;
    imageView_plants.animationRepeatCount = 0;
    [imageView_plants startAnimating];
    
}

#pragma mark - 僵尸BZombie数组

- (void)addBZombie {
    UIImageView *imageView_BZombie = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 164, 80, 100, 100)];
    [self.imageViewBack addSubview:imageView_BZombie];
    [imageView_BZombie release];
    
    NSMutableArray *imageArr_BZombie = [NSMutableArray array];
    
    for (int i = 1; i < 26; i++) {
        
        NSString *name = [NSString stringWithFormat:@"BZombie%d.tiff", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [imageArr_BZombie addObject:image];
        [image release];
    
    }
    
    imageView_BZombie.animationImages = imageArr_BZombie;
    imageView_BZombie.animationDuration = 0.01;
    imageView_BZombie.animationRepeatCount = 0;
    [imageView_BZombie startAnimating];

}

#pragma mark - 僵尸BZombie2数组

- (void)addBZombie2 {
    UIImageView *imageView_BZombie2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 164, 520, 100, 100)];
    [self.imageViewBack addSubview:imageView_BZombie2];
    [imageView_BZombie2 release];
    
    NSMutableArray *imageArr_BZombie2 = [NSMutableArray array];
    
    for (int i = 1; i < 26; i++) {
        
        NSString *name = [NSString stringWithFormat:@"BZombie%d.tiff", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [imageArr_BZombie2 addObject:image];
        [image release];
        
    }
    
    imageView_BZombie2.animationImages = imageArr_BZombie2;
    imageView_BZombie2.animationDuration = 0.05;
    imageView_BZombie2.animationRepeatCount = 0;
    [imageView_BZombie2 startAnimating];
    
}

    


#pragma mark - 僵尸zombie数组

- (void)addZombie {
    
    UIImageView *imageView_zombie = [[UIImageView alloc] initWithFrame:CGRectMake(250, 300, 100, 100)];
    [self.imageViewBack addSubview:imageView_zombie];
    [imageView_zombie release];
    
    NSMutableArray *imageArr_zombie = [NSMutableArray array];
    
    for (int i = 0; i < 22; i++) {
        
        NSString *name = [NSString stringWithFormat:@"Zombie%d.tiff", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [imageArr_zombie addObject:image];
        [image release];
        
    }
    
    imageView_zombie.animationImages = imageArr_zombie;
    imageView_zombie.animationDuration = 0.3;
    imageView_zombie.animationRepeatCount = 0;
    [imageView_zombie startAnimating];
    
//    [UIView animateWithDuration:10 animations:^{
//        
//        imageView_zombie.frame = CGRectMake(-100, 80, 100, 100);
//        
//    }];
    
//    [imageView_zombie performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:10];

}

- (void)dealloc {
    
    [_arrAnimation release];
    [_imageViewBack release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
