//
//  ParserSAX.m
//  UI17_XML_JSON
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ParserSAX.h"
#import "ModelForStudent.h"
@interface ParserSAX ()<NSXMLParserDelegate>
@property (nonatomic, retain) NSMutableArray *arr;
// 保存标签之间的值.
@property (nonatomic, copy) NSString *content;
@end

@implementation ParserSAX


- (NSArray *)parserSAXWithFile:(NSString *)filePath {
    
    self.arr = [NSMutableArray array];
    
    // NSXMLParser
    NSXMLParser *xmlPar = [[NSXMLParser alloc] initWithData:[NSData dataWithContentsOfFile:filePath]];
    
    // 数据通过协议回调出来的.
    xmlPar.delegate = self;
    
    // 开始解析
    [xmlPar parse];
    
    
    
    return self.arr;
    
}

#pragma mark - NSXMLParserDelegate
/** 读到开始标签的时候, 调用此方法. */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    // 读到<student>子标签时
    if ([elementName isEqualToString:@"student"]) {
        
        ModelForStudent *model = [[ModelForStudent alloc] init];
        [self.arr addObject:model];
        
        
    }
}

/** 读到标签之间的值的时候, 调用此方法. */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    self.content = string;
}

/** 读到标签结束的时候, 调用此方法. */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    // 指向数组中最后一个model对象.
    ModelForStudent *model = [self.arr lastObject];
    
    if ([elementName isEqualToString:@"name"]) {
        
       //ModelForStudent *model = [self.arr objectAtIndex:self.arr.count - 1];
        model.name = self.content;
        
    } else if ([elementName isEqualToString:@"age"]) {
        model.age = self.content;
    } else if ([elementName isEqualToString:@"sex"]) {
        model.sex = self.content;
    } else if ([elementName isEqualToString:@"number"]) {
        model.number = self.content.integerValue;
    }
}



@end
