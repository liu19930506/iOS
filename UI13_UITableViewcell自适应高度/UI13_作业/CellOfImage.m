//
//  CellOfImage.m
//  UI13_作业
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfImage.h"


@interface CellOfImage ()

@property (nonatomic, retain) UIImageView *imageViewForPic;

@end

@implementation CellOfImage


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
    
    self.imageViewForPic.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, self.imageViewForPic.image.size.height / self.imageViewForPic.image.size.width * [UIScreen mainScreen].bounds.size.width - 20);

}

- (void)passModel:(NSString *)str {
    
    self.imageViewForPic.image = [UIImage imageNamed:str];

}

/** cell总高度 */
+ (CGFloat)heightForCellWithName:(NSString *)name {
    
    UIImage *image = [UIImage imageNamed:name];
    
    return image.size.height / image.size.width * [UIScreen mainScreen].bounds.size.width - 20 + 20;
    
}


- (void)dealloc {
    
    [_imageViewForPic release];
    [super dealloc];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
