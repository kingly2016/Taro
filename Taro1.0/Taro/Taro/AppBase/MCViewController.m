//
//  MCViewController.m
//  Taro
//
//  Created by Apple on 17/4/26.
//  Copyright © 2017年 taro.app. All rights reserved.
//

#import "MCViewController.h"

@interface MCViewController () {
    BOOL _isLoaded;
}

@end

@implementation MCViewController

- (instancetype)init {
    self = [super init];
    if (self) {

    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

//    [[JSEngine sharedInstance] ex]
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (!_isLoaded) {
        _isLoaded = !_isLoaded;
//        [[JSEngine sharedInstance] ex]
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableDictionary *)viewDictionary {
    if (!_viewDictionary) {
        _viewDictionary = [NSMutableDictionary dictionary];
    }

    return _viewDictionary;
}

- (void)onPushViewController:(NSString *)bundleName pageName:(NSString *)pageName pageParams:(NSDictionary *)params {
    NSError *error;
    if (bundleName.length == 0) {
        bundleName = self.bundle.bundleId;
    }

    MCViewController *vc = [[VCFactory sharedInstance] create:bundleName pageName:pageName pageParams:params error:&error];
    MCNavigationController *navCtr = self.navigationController ?: [UIApplication sharedApplication].keyWindow.rootViewController;
    [navCtr pushViewController:vc animated:YES];
}

- (void)onPopViewController:(NSDictionary *)pageParams {
    MCViewController *vc = self.navigationController.viewControllers[self.navigationController.viewControllers.count - 2];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:vc.pageParams];
    [params addEntriesFromDictionary:pageParams];
    vc.pageParams = params;
    [self.navigationController popToViewController:vc animated:YES];
}

#pragma JSPageExport

- (id)createElementById:(NSString *)elementName {
    return nil;
}

- (id)getElementById:(NSString *)ID {
    return [_viewDictionary objectForKey:ID];
}

@end
