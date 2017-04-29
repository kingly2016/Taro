//
//  UIView+Property.h
//  mWidget
//
//  Created by Apple on 17/1/26.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Property)

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *elementName;
@property (nonatomic, strong) NSMutableDictionary *attributeDictionary;

@end
