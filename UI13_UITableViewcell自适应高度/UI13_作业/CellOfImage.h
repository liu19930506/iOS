//
//  CellOfImage.h
//  UI13_作业
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellOfImage : UITableViewCell
- (void)passModel:(NSString *)str;

+ (CGFloat)heightForCellWithName:(NSString *)name;
@end
