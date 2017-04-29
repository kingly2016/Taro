//
//  XMLElement.h
//  mWidget
//
//  Created by Apple on 17/1/26.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLElement : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, strong) NSMutableDictionary *attrDictionary;
@property (nonatomic, strong) XMLElement *parent;
@property (nonatomic, strong) NSMutableArray *children;

@end
