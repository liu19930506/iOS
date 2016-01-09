//
//  Cell.h
//  UI18_作业(NSURLSession)
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;

@interface Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;

- (void)passDataWithModel:(Model *)model;
@end
