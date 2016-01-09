//
//  ParserSAX.m
//  UI17_作业(数据解析)
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ParserSAX.h"
#import "Model.h"
@interface ParserSAX ()<NSXMLParserDelegate>
@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSMutableString *desc;
@property (nonatomic, assign) BOOL flag;
@end

@implementation ParserSAX

- (NSMutableArray *)parserSAXWithFile:(NSString *)filePath {
    
    self.arr = [NSMutableArray array];
    
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[NSData dataWithContentsOfFile:filePath]];
    
    parser.delegate = self;
    
    [parser parse];
    
    return self.arr;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
    self.desc = [NSMutableString string];
    
    
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    [self.desc setString:@""];
    if ([elementName isEqualToString:@"AlbumInfo"]) {
        Model *model = [[Model alloc] init];
        [self.arr addObject:model];
        [model release];
    
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
 
    [self.desc appendString:string];
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    Model *model = [self.arr lastObject];
    
    if ([elementName isEqualToString:@"name"]) {
        
        model.name = self.desc;
        
    } else if ([elementName isEqualToString:@"desc"]) {
        
        model.desc = self.desc;
        
    }

}


- (void)dealloc {
    
    [_desc release];
    [_name release];
    [_arr release];
    [super dealloc];
    
}
@end
