//
//  CellOfNews.m
//  UI13_UITableViewcell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfNews.h"
#import "ModelOfNews.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface CellOfNews ()

@property (nonatomic, retain) UILabel *labelOfTitle;
@property (nonatomic, retain) UILabel *labelOfSummary;

@end


@implementation CellOfNews

- (void)dealloc {
    [_labelOfTitle release];
    [_labelOfSummary release];
    [super dealloc];
}

+ (CGFloat )heightForLabel:(NSString *)text {
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;
    
}

+ (CGFloat )heightForCell:(ModelOfNews *)model {
    
   CGFloat height = [CellOfNews heightForLabel:model.summary];
    
    return height + 10 + 50 + 10 + 10;
}

- (void)passModel:(ModelOfNews *)model {
    
    self.labelOfTitle.text = model.title;
    self.labelOfSummary.text = model.summary;
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createSubviews];
        
    }
    
    return self;
}

- (void)createSubviews {
    
    self.labelOfTitle = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelOfTitle];
    [self.labelOfTitle release];
    
    self.labelOfSummary = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelOfSummary];
    [self.labelOfSummary release];
    
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    /** 子控件frame设置. */
    self.labelOfTitle.frame = CGRectMake(10, 10, WIDTH - 20, 50);
    self.labelOfTitle.numberOfLines = 0;
    self.labelOfSummary.frame = CGRectMake(10, 10 + 50 + 10, WIDTH - 20, [[self class] heightForLabel:self.labelOfSummary.text]);
    self.labelOfSummary.numberOfLines = 0;
   
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
