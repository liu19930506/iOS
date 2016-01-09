//
//  CellFoImage.m
//  UI13_UITableViewcell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellForImage.h"



@implementation CellForImage

- (void)dealloc {
    
    [_imageViewForPic release];
    [super dealloc];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
        [self createSubviews];
        
    }
    return self;
}

- (void)createSubviews {
    
    self.imageViewForPic = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageViewForPic];
    [self.imageViewForPic release];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.imageViewForPic.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, [[self class] heightForImage:self.imageViewForPic.image]);
    
}

/** 等比例计算图片的高度. */
+ (CGFloat)heightForImage:(UIImage *)image {
    
    return image.size.height / image.size.width * ([UIScreen mainScreen].bounds.size.width - 20);
    
}


+ (CGFloat)heightForCellWithName:(NSString *)name {
    
    /** 创建UIImage对象. */
    UIImage *image = [UIImage imageNamed:name];
    
    /** 利用image的size属性计算高度. */

    return image.size.height / image.size.width * ([UIScreen mainScreen].bounds.size.width - 20) + 20;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
