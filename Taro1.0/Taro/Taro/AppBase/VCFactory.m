//
//  VCFactory.m
//  Taro
//
//  Created by Apple on 17/4/26.
//  Copyright © 2017年 taro.app. All rights reserved.
//

#import "VCFactory.h"
#import "BundleConfig.h"
#import "BundleModel.h"

@interface VCFactory ()

@property (nonatomic, strong) BundleModel *currentBundle;
@property (nonatomic, strong) NSMutableArray *bundles;
@property (nonatomic, copy) NSString *currentBundleDir;

@end

@implementation VCFactory

+ (instancetype)sharedInstance {
    static VCFactory *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[VCFactory alloc] init];
    });

    return _sharedInstance;
}

- (MCViewController *)create:(NSString *)bundleName pageName:(NSString *)pageName pageParams:(NSDictionary *)params error:(NSError **)error {
    self.currentBundle = [self getBundleConfig:bundleName];

    MCViewController *vc = [[MCViewController alloc] init];

    return vc;
}

- (BundleModel *)getBundleConfig:(NSString *)bundleName {
    return nil;
}

@end
