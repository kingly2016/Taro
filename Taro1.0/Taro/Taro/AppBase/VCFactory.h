//
//  VCFactory.h
//  Taro
//
//  Created by Apple on 17/4/26.
//  Copyright © 2017年 taro.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCViewController.h"

@interface VCFactory : NSObject

+ (instancetype)sharedInstance;

- (MCViewController *)create:(NSString *)bundleName pageName:(NSString *)pageName pageParams:(NSDictionary *)params error:(NSError **)error;

@end
