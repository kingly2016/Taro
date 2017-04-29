//
//  WidgetMapping.h
//  mWidget
//
//  Created by Apple on 17/1/27.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLElement.h"

@interface WidgetMapping : NSObject

+ (instancetype)sharedInstance;

- (Class)classFromString:(NSString *)elementName;

- (NSArray *)properties:(NSString *)elementName;

- (XMLElement *)property:(NSString *)attrName elementName:(NSString *)elementName;


@end
