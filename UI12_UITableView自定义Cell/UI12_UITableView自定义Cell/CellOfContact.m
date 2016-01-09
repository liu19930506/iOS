//
//  CellOfContact.m
//  UI12_UITableView自定义Cell
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfContact.h"

@implementation CellOfContact

- (void)dealloc {
    [_imageViewLeft release];
    [_imageViewCenter release];
    [_imageViewRight release];
    [super dealloc];
}

/** 子控件的创建. 一般选择cell在创建的时候. */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        

        NSLog(@"%s, %f, %f", __FUNCTION__, self.contentView.frame.size.width, self.contentView.frame.size.height);
        
        [self createSubview];
        
    }
    return self;
}

- (void)createSubview {
    
    /** 3个子控件创建. */
    self.imageViewLeft = [[UIImageView alloc] init];
    self.imageViewLeft.backgroundColor = [UIColor redColor];
    /** 注意: 添加在cell.contentView上面 */
    [self.contentView addSubview:self.imageViewLeft];
    [self.imageViewLeft release];
    
    self.imageViewCenter = [[UIImageView alloc] init];
    self.imageViewCenter.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.imageViewCenter];
    [self.imageViewCenter release];
    
    self.imageViewRight = [[UIImageView alloc] init];
    self.imageViewRight.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.imageViewRight];
    [self.imageViewRight release];
    
}



/** 子控件的frame设置. 一般实在layoutSubviews方法中设置.
 *  layoutSubviews是UIView的方法, View出现之前调用此方法
 */
- (void)layoutSubviews {
    
    /** 必须先调用父类方法. */
    [super layoutSubviews];
    NSLog(@"%s, %f, %f", __FUNCTION__, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    self.imageViewLeft.frame = CGRectMake(10, 10, (width - 40) / 3, height - 20);
    self.imageViewCenter.frame = CGRectMake(20 + (width - 40) / 3, 10, (width - 40) / 3, height - 20);
    self.imageViewRight.frame = CGRectMake(30 + (width - 40) / 3 * 2, 10, (width - 40) / 3, height - 20);
}









/** 当cell 从xib文件进入时, 调用此方法. */
- (void)awakeFromNib {
    // Initialization code
}

/** 当点击cell时, 调用此方法 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
