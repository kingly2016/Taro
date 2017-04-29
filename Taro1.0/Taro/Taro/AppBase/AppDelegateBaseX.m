//
//  AppDelegateBaseX.m
//  Taro
//
//  Created by Apple on 17/4/26.
//  Copyright © 2017年 taro.app. All rights reserved.
//

#import "AppDelegateBaseX.h"
#import "MCViewController.h"
#import "MCNavigationController.h"
#import "VCFactory.h"

@implementation AppDelegateBaseX

- (void)startBundle:(NSString *)bundleName {
    NSError *error;
    if (!bundleName.length) {
        bundleName = defaultBundle;
    }

    MCViewController *vc = [[VCFactory sharedInstance] create:bundleName pageName:nil pageParams:nil error:&error];
    MCNavigationController *navigationCtr = [[MCNavigationController alloc] initWithRootViewController:vc];
    navigationCtr.navigationBar.translucent = NO;
    self.window.rootViewController = navigationCtr;
}

@end
