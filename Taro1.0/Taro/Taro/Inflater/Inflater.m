//
//  Inflater.m
//  mWidget
//
//  Created by Apple on 17/1/26.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import "Inflater.h"

@interface Inflater ()

@property (nonatomic, strong) MCViewController *vc;

@end

@implementation Inflater

- (void)inflaterPage:(MCViewController *)vc {
    [self setVc:vc];
    UIView *rootView = _vc.view;
    //body节点
    XMLElement *bodyElement = _vc.pageElement.children.lastObject;
    [self inflaterView:rootView :bodyElement];
}

- (void)inflaterView:(UIView *)rootView :(XMLElement *)rootElement {
    if (!rootElement) {
        return;
    }

    for (XMLElement *e in rootElement.children) {
        Class cls = [[WidgetMapping sharedInstance] classFromString:e.name];
        UIView *view = [[cls alloc] init];
        view.elementName = e.name;
        view.attributeDictionary = [e.attrDictionary mutableCopy];

        ViewWrapper *viewWrapper = [[ViewWrapper alloc] init:view pageName:_vc.pageName];
        for (NSString *key in e.attrDictionary.allKeys) {
            [viewWrapper setAttribute:key attrValue:e.attrDictionary[key]];
        }

        [rootView addSubview:view];
        if (view.ID) {
            [_vc.viewDictionary setObject:viewWrapper forKey:view.ID];
        }

        if (e.children) {
            [self inflaterView:view :e];
        }
    }
}

@end
