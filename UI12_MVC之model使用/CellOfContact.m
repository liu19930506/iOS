//
//  CellOfContact.m
//  UI12_MVC之model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfContact.h"
#import "Contact.h"


@interface CellOfContact ()
@property (nonatomic, retain) UIImageView *imageViewLeft;
@property (nonatomic, retain) UILabel *labelName;
@end

@implementation CellOfContact


- (void)passModel:(Contact *)con {
    
    /** 子控件赋值. */
    self.imageViewLeft.image = [UIImage imageNamed:con.photo];
    self.labelName.text = con.name;
    
}

- (void)dealloc {
    
    [_imageViewLeft release];
    [_labelName release];
    [super dealloc];
    
}


/** 重写属性con的set方法. */
- (void)setCon:(Contact *)con {
    
    if (_con != con) {
        
        [_con release];
        _con = [con retain];
    
    }
    
    /** 子控件赋值. */
    self.imageViewLeft.image = [UIImage imageNamed:con.photo];
    self.labelName.text = con.name;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self createSubviews];
        
    }
    return self;
}

- (void)createSubviews {
    
    self.imageViewLeft = [[UIImageView alloc] init];
    
    [self.contentView addSubview:self.imageViewLeft];
    [_imageViewLeft release];
    self.labelName = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelName];
    [_labelName release];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    self.imageViewLeft.frame = CGRectMake(10, 10, height - 20, height - 20);
    self.labelName.frame = CGRectMake(width - 70, 10, 100, height - 20);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
