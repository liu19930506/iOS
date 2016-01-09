//
//  Contact.m
//  UI12_作业(MVC重写通讯录)
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)dealloc {
    
    [_photoOf release];
    [_name release];
    [_phone release];
    [_hobby release];
    [_photo release];
    [super dealloc];
}

@end
