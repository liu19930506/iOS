//
//  Cell.h
//  UI14_作业
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelForList;

@interface Cell : UITableViewCell

- (void)passModel:(ModelForList *)model;

@end
