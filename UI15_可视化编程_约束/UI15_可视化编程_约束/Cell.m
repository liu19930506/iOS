//
//  Cell.m
//  UI14_作业
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Cell.h"
#import "ModelForList.h"


@interface Cell ()
@property (retain, nonatomic) IBOutlet UIView *viewBack;
@property (retain, nonatomic) IBOutlet UILabel *labelOfTitle;
@property (retain, nonatomic) IBOutlet UIView *viewWhite;
@property (retain, nonatomic) IBOutlet UILabel *startTime;
@property (retain, nonatomic) IBOutlet UILabel *endTime;
@property (retain, nonatomic) IBOutlet UILabel *address;
@property (retain, nonatomic) IBOutlet UILabel *catagory;
@property (retain, nonatomic) IBOutlet UILabel *intersting;
@property (retain, nonatomic) IBOutlet UILabel *parci;

@end

@implementation Cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)passModel:(ModelForList *)model {
    self.labelOfTitle.text = model.title;
    self.intersting.text = model.wisher_count.description;
    self.address.text = model.address.description;
    self.parci.text = model.participant_count.description;
    self.startTime.text = model.begin_time;
    self.endTime.text = model.end_time;
    self.catagory.text = model.category_name;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.viewBack.layer.cornerRadius = 10;
    self.viewWhite.layer.cornerRadius = 5;
    self.viewWhite.layer.shadowOffset = CGSizeMake(0, 1);
    self.viewWhite.layer.shadowOpacity = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_viewBack release];
    [_labelOfTitle release];
    [_viewWhite release];
    [_startTime release];
    [_endTime release];
    [_address release];
    [_catagory release];
    [_intersting release];
    [_parci release];
    [super dealloc];
}
@end
