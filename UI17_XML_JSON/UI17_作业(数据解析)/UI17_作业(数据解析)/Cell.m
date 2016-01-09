//
//  Cell.m
//  UI17_作业(数据解析)
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Cell.h"
#import "Model.h"

@implementation Cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
        
    }
    return self;
}

- (void)passModel:(Model *)model {
    
    self.labelName.text = model.name;
    self.labelDesc.text = model.desc;
    
}

+ (CGFloat)heightForLabel:(NSString *)label {
    
    CGRect rect = [label boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    return rect.size.height;
    
    
}

+ (CGFloat)heightForCell:(Model *)model {
    
    CGFloat height = [Cell heightForLabel:model.desc];
    
    return height + 10 + 30 + 10 + 10 + 20;
}


- (void)createSubviews {
    self.labelName = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelName];
    [self.labelName release];
    
    
    
    self.labelDesc = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelDesc];
    [self.labelDesc release];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.labelName.numberOfLines = 0;
    self.labelDesc.numberOfLines = 0;
    
}

- (void)dealloc {
    
    [_labelDesc release];
    [_labelName release];
    [super dealloc];
    
}
@end
