//
//  Inflater.h
//  Taro
//
//  Created by Apple on 17/4/26.
//  Copyright © 2017年 taro.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCViewController.h"
#import "ViewWrapper.h"
#import "WidgetMapping.h"
#import "UIView+Property.h"

@interface Inflater : NSObject

- (void)inflaterPage:(MCViewController *)vc;

@end
