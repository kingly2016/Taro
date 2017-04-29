//
//  ViewWrapper.m
//  mWidget
//
//  Created by Apple on 17/1/26.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import "ViewWrapper.h"
#import "ViewWrapper+Font.h"
#import "WidgetMapping.h"
#import "UIView+Property.h"
#import "UIColor+Utility.h"

@interface ViewWrapper () {
    NSString *_pageName;
    UIView *_view;
}

@end

@implementation ViewWrapper

- (instancetype)init:(UIView *)view pageName:(NSString *)pageName {
    self = [super init];
    if (self) {
        _view = view;
        _pageName = pageName;
    }

    return self;
}

- (UIView *)view {
    return _view;
}

- (BOOL)doSetAttribute:(NSString *)attrName attrValue:(id)value {
    XMLElement *element = [[WidgetMapping sharedInstance] property:attrName elementName:_view.elementName];
    NSString *dataType = element.attrDictionary[@"dataType"];
    if ([dataType isEqualToString:@"Color"]) {
        value = [UIColor colorWithHexString:value];
    } else if ([dataType isEqualToString:@"Font"]) {
        value = [self font:_view];
    } else if ([dataType isEqualToString:@"Selector"]) {
        [self registerMethod:element attrValue:value];
        return YES;
    }

    BOOL result;
    switch (element.children.count) {
        case 0:{
            label:{
                NSString *mapping_name = element.attrDictionary[@"mapping-name"];
                if (mapping_name) {
                    [_view setValue:value forKey:mapping_name];
                    result = YES;
                }
            }
            break;
        }
            //getter || setter
        case 1:{
            XMLElement *elementChildren = element.children.firstObject;
            if ([elementChildren.name isEqualToString:@"setter"]) {
                [self executeMethod:elementChildren attrValue:value];
            } else {
                goto label;
            }

            break;
        }
            //getter && setter
        case 2:{
            XMLElement *elementChildren = element.children.firstObject;
            if (![elementChildren.name isEqualToString:@"setter"]) {
                elementChildren = element.children.lastObject;
            }
            [self executeMethod:elementChildren attrValue:value];

            break;
        }
        default:
            break;
    }

    return result;
}

- (void)executeMethod:(XMLElement *)element attrValue:(id)value {

}

- (void)registerMethod:(XMLElement *)element attrValue:(id)value {

}

@end
