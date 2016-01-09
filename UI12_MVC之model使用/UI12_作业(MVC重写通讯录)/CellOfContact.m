//
//  CellOfContact.m
//  UI12_作业(MVC重写通讯录)
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "CellOfContact.h"
#import "Contact.h"
@interface CellOfContact ()

@property (nonatomic, retain) UIImageView *imageViewLeft;
@property (nonatomic, retain) UILabel *label;

@end



@implementation CellOfContact

- (void)passModel:(Contact *)con {
    
    
    if (con.photo == nil) {
        
        self.imageViewLeft.image = con.photoOf;
        
    } else {
        
        self.imageViewLeft.image = [UIImage imageNamed:con.photo];
    }
    
    self.label.text = con.name;
    
}

- (void)dealloc {
    
   [_imageViewLeft release];
    [_label release];
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
    
    self.imageViewLeft = [[UIImageView alloc] init];
    self.imageViewLeft.layer.cornerRadius = 40;
    
    self.imageViewLeft.layer.masksToBounds = YES;
    [self.contentView addSubview:self.imageViewLeft];
    [self.imageViewLeft release];
    
    self.label = [[UILabel alloc] init];
    [self.contentView addSubview:self.label];
    self.label.textAlignment = 1;
    self.label.layer.cornerRadius = 10;
    self.label.layer.masksToBounds = YES;
    
    [self.label release];
    
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.imageViewLeft.frame = CGRectMake(10, 10, 80, 80);
    self.label.frame = CGRectMake(self.contentView.frame.size.width / 2 + 10, 30, 100, 40);
    

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
