//
//  ParserDOM.m
//  UI17_作业(数据解析)
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ParserDOM.h"
#import "GDataXMLNode.h"
#import "Model.h"
@interface ParserDOM ()
@property (nonatomic, retain) NSMutableArray *arr;
@end

@implementation ParserDOM
- (NSMutableArray *)parserDOMWithFile:(NSString *)filePath {
    self.arr = [NSMutableArray array];
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:[NSData dataWithContentsOfFile:filePath] options:0 error:nil];
    GDataXMLElement *root = [document rootElement];
    NSArray *arr = [root elementsForName:@"result"];
    for (GDataXMLElement *element in arr) {
        NSArray *arr = [element elementsForName:@"results"];
        for (GDataXMLElement *element in arr) {
            NSArray *arr = [element elementsForName:@"AlbumInfo"];
            for (GDataXMLElement *element in arr) {
            
                Model *model = [[Model alloc] init];
                model.name = [[[element elementsForName:@"name"] lastObject] stringValue];
                
                model.desc = [[[element elementsForName:@"desc"] lastObject] stringValue];
                [self.arr addObject:model];
                NSLog(@"ddd");
            }
        }
        

        
    }
    
    return self.arr;
    
}

- (void)dealloc {
    [_arr release];
    [super dealloc];
}
@end
