//
//  MCViewController.h
//  Taro
//
//  Created by Apple on 17/4/26.
//  Copyright © 2017年 taro.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "BundleModel.h"
#import "XMLElement.h"

@protocol JSPageExport <JSExport>

- (id)createElementById:(NSString *)elementName;

- (id)getElementById:(NSString *)ID;

@end

@interface MCViewController : UIViewController <JSPageExport, UIActionSheetDelegate>

@property (nonatomic, strong) JSContext *ctx;
//MMLProject_page_base_person_随机数
@property (nonatomic, copy) NSString *pageName;

@property (nonatomic, strong) NSDictionary *pageParams;
@property (nonatomic, strong) NSMutableDictionary *viewDictionary;
@property (nonatomic, strong) XMLElement *pageElement;
@property (nonatomic, strong) BundleModel *bundle;

- (void)onPushViewController:(NSString *)bundleName pageName:(NSString *)pageName pageParams:(NSDictionary *)params;

- (void)onPopViewController:(NSDictionary *)pageParams;

@end
