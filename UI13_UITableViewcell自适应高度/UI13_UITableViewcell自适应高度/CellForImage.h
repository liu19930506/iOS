//
//  CellFoImage.h
//  UI13_UITableViewcell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellForImage : UITableViewCell

@property (nonatomic, retain) UIImageView *imageViewForPic;
+ (CGFloat)heightForCellWithName:(NSString *)name;
@end
