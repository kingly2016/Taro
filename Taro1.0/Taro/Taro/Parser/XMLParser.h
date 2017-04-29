//
//  XMLParser.h
//  mWidget
//
//  Created by Apple on 17/1/26.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLElement.h"

@interface XMLParser : NSObject

+ (instancetype)sharedInstance;

- (XMLElement *)parseFile:(NSString *)fileName;

- (XMLElement *)parseString:(NSString *)xmlString;

@end
