//
//  ViewWrapper.h
//  mWidget
//
//  Created by Apple on 17/1/26.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ViewWrapperJSExport <JSExport>

//设置属性
JSExportAs(setAttribute, - (BOOL)setAttribute:(NSString *)attrName attrValue:(id)value);
//获取属性
JSExportAs(getAttribute, - (id)getAttribute:(NSString *)attrName);

@end

@interface ViewWrapper : NSObject <ViewWrapperJSExport>

- (instancetype)init:(UIView *)view pageName:(NSString *)pageName;

- (UIView *)view;

@end
