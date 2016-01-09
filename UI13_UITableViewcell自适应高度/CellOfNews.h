//
//  CellOfNews.h
//  UI13_UITableViewcell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelOfNews;

@interface CellOfNews : UITableViewCell

- (void)passModel:(ModelOfNews *)model;
+ (CGFloat )heightForCell:(ModelOfNews *)model;
@end
