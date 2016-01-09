//
//  CellForCustom.h
//  UI14_TableView自定义cell_代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellForCustom;

@protocol CellForCustomDelegate <NSObject>

- (void)handleDeleAction:(CellForCustom *)cell;

@end

@interface CellForCustom : UITableViewCell
@property (nonatomic, retain) UILabel *labelForTitle;
@property (nonatomic, assign) id<CellForCustomDelegate>delegate;
@end
