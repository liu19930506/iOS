//
//  ParserDOM.m
//  UI17_XML_JSON
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ParserDOM.h"
#import "GDataXMLNode.h"
#import "ModelForStudent.h"
@interface ParserDOM ()
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation ParserDOM
- (NSArray *)parserDOMWithFile:(NSString *)filePath {
    
    self.arr = [NSMutableArray array];
    
    NSError *error = nil;
    // 创建GDataXMLDocument对象.
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:[NSData dataWithContentsOfFile:filePath] options:1 error:&error];
    
    // 获取根元素.
    GDataXMLElement *root = [document rootElement];

    
    // 获取<student>子元素
    NSArray *arr = [root elementsForName:@"student"];
    for (GDataXMLElement *element in arr) {
        ModelForStudent *model = [[ModelForStudent alloc] init];
        model.name = [[[element elementsForName:@"name"] lastObject] stringValue];
        model.age = [[[element elementsForName:@"age"] lastObject] stringValue];
        model.sex = [[[element elementsForName:@"sex"] lastObject] stringValue];
        model.number = [[[[element elementsForName:@"number"] lastObject] stringValue] integerValue];
        
        [self.arr addObject:model];
        
    }
    return self.arr;
}

@end
