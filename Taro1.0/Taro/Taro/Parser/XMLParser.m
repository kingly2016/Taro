//
//  XMLParser.m
//  mWidget
//
//  Created by Apple on 17/1/26.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import "XMLParser.h"

@interface XMLParser ()

@property (nonatomic, strong) XMLElement *rootElement;
@property (nonatomic, strong) XMLElement *currentElement;

@end

@implementation XMLParser


+ (instancetype)sharedInstance {
    static XMLParser *_sharedInstance;
    static dispatch_once_t onceToke;
    dispatch_once(&onceToke, ^{
        _sharedInstance = [[XMLParser alloc] init];
    });

    return _sharedInstance;
}

- (XMLElement *)parseFile:(NSString *)fileName {
    NSData *xmlData = [NSData dataWithContentsOfFile:fileName];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    xmlParser.delegate = self;
    if ([xmlParser parse]) {
        return self.rootElement;
    }

    return nil;
}

- (XMLElement *)parseString:(NSString *)xmlString {
    return nil;
}


/**
 *  开始加载文档
 *
 *  @param parser <#parser description#>
 */
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.rootElement = nil;
    self.currentElement = nil;
}

/**
 *  结束加载文档
 *
 *  @param parser <#parser description#>
 */
- (void)parserDidEndDocument:(NSXMLParser *)parser {

}

/**
 *  开始解析标签
 *
 *  @param parser        <#parser description#>
 *  @param elementName   <#elementName description#>
 *  @param namespaceURI  <#namespaceURI description#>
 *  @param qName         <#qName description#>
 *  @param attributeDict <#attributeDict description#>
 */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {


    XMLElement *newElement = [[XMLElement alloc] init];
    newElement.name = elementName;
    newElement.attrDictionary = [NSMutableDictionary dictionaryWithDictionary:attributeDict];

    if (!self.rootElement) {
        self.rootElement = newElement;
    } else {
        newElement.parent = self.currentElement;
        [self.currentElement.children addObject:newElement];
    }

    self.currentElement = newElement;
}

/**
 *  结束解析标签
 *
 *  @param parser       <#parser description#>
 *  @param elementName  <#elementName description#>
 *  @param namespaceURI <#namespaceURI description#>
 *  @param qName        <#qName description#>
 */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    self.currentElement = self.currentElement.parent;
}

/**
 *  读取标签间的文本
 *
 *  @param parser <#parser description#>
 *  @param string <#string description#>
 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if([self.currentElement.value length] > 0){
        self.currentElement.value = [self.currentElement.value stringByAppendingString:string];
    } else {
        self.currentElement.value = [NSMutableString stringWithString:string];
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
}


@end
