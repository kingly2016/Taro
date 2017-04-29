//
//  XMLElement.m
//  mWidget
//
//  Created by Apple on 17/1/26.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import "XMLElement.h"

@implementation XMLElement

- (instancetype)init {
    self = [super init];
    if (self) {
        self.attrDictionary = [NSMutableDictionary dictionary];
        self.children = [NSMutableArray array];
    }

    return self;
}

@end
