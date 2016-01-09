//
//  CellForCustom.m
//  UI14_TableView自定义cell_代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellForCustom.h"

#define WIDTH self.contentView.frame.size.width
#define HEIGHT self.contentView.frame.size.height
@interface CellForCustom ()

@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) UIButton *buttonForDelete;
@property (nonatomic, retain) UIButton *buttonForEdit;
@end

@implementation CellForCustom

- (void)dealloc {
    
    [_labelForTitle release];
    [_scroll release];
    [_buttonForDelete release];
    [_buttonForEdit release];
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
    
    /** scrollView */
    self.scroll = [[UIScrollView alloc] init];
    [self.contentView addSubview:self.scroll];
    self.scroll.backgroundColor = [UIColor lightGrayColor];
    [_scroll release];
    self.scroll.showsHorizontalScrollIndicator = NO;
    self.scroll.bounces = NO;
    self.scroll.pagingEnabled = YES;
    
    /** buttonForDelete */
    self.buttonForDelete = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scroll addSubview:self.buttonForDelete];
   // [self.buttonForDelete setBackgroundImage:[UIImage imageNamed:@"iconfont-shanchu"] forState:UIControlStateNormal];
    [self.buttonForDelete setImage:[UIImage imageNamed:@"iconfont-shanchu"] forState:UIControlStateNormal];
    self.buttonForDelete.backgroundColor = [UIColor redColor];
    [self.buttonForDelete addTarget:self action:@selector(handleDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    /** buttonForEdit */
    self.buttonForEdit = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.scroll addSubview:self.buttonForEdit];
    [self.buttonForEdit setTitle:@"Edit" forState:UIControlStateNormal];
    self.buttonForEdit.backgroundColor = [UIColor whiteColor];
    
    /** label */
    self.labelForTitle = [[UILabel alloc] init];
    [self.scroll addSubview:self.labelForTitle];
    [_labelForTitle release];
    
}

- (void)handleDelete:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(handleDeleAction:)]) {
        
        [self.delegate handleDeleAction:self];
    }
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    //scrollView
    self.scroll.frame = self.contentView.frame;
    self.scroll.contentSize = CGSizeMake(WIDTH + 50 + 80, HEIGHT);
    
    //button
    self.buttonForEdit.frame = CGRectMake(WIDTH, 0, 50, HEIGHT);
    
    self.buttonForDelete.frame = CGRectMake(WIDTH + 50, 0, 80, HEIGHT);
    
    //label
    self.labelForTitle.frame = CGRectMake(10, 10, 100, HEIGHT - 20);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
