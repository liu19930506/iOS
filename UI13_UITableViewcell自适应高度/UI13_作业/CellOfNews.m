//
//  CellOfNews.m
//  UI13_作业
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfNews.h"
#import "ModelOfNews.h"
@interface CellOfNews ()
@property (nonatomic, retain) UILabel *labelTitle;
@property (nonatomic, retain) UILabel *labelSummary;
@end

@implementation CellOfNews

- (void)dealloc {
    [_labelTitle release];
    [_labelSummary release];
    [super dealloc];
}


- (void)passModel:(ModelOfNews *)model {
    
    self.labelTitle.text = model.title;
    self.labelSummary.text = model.summary;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createSubviews];
        
    }
    return self;
}

- (void)createSubviews {
    
    self.backgroundColor = [UIColor clearColor];
    
    self.labelTitle = [[UILabel alloc] init];
    //self.labelTitle.alpha = 0;
    [self.contentView addSubview:self.labelTitle];
    self.labelTitle.numberOfLines = 0;
    [self.labelTitle release];
    
    self.labelSummary = [[UILabel alloc] init];
    //self.label
    [self.contentView addSubview:self.labelSummary];
    self.labelSummary.numberOfLines = 0;
    [self.labelSummary release];
    
}

+ (CGFloat)heightLable:(NSString *)str {
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;
    
}

+ (CGFloat)heightForCell:(ModelOfNews *)model {

    
    CGRect rect = [model.summary boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height + 10 + 10 + 10 + 50;

}


- (void)layoutSubviews {
    
    [super layoutSubviews];

    self.labelTitle.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 50);
    self.labelSummary.frame = CGRectMake(10, 10 + 50 + 10, [UIScreen mainScreen].bounds.size.width - 20, [[self class] heightLable:self.labelSummary.text]);
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
