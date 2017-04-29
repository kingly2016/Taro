//
//  FunctionMacro.h
//  mWidget
//
//  Created by Apple on 17/1/27.
//  Copyright © 2017年 cn.youkoo.mCloud.widget. All rights reserved.
//
//  函数宏
//

#ifndef FunctionMacro_h
#define FunctionMacro_h

//打印
#ifdef DEBUG
    #define log(fmt, ...) NSLog((@"%s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define log(...)
#endif

// block self
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

// device verson float value
#define CURRENT_SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// iPad
#define kIsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//屏幕大小
#define MDK_SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define MDK_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height


#define IOS_3_5_Inch() ([[UIScreen mainScreen] bounds].size.height == 480) ? YES :NO
#define IOS_4_0_Inch() ([[UIScreen mainScreen] bounds].size.height == 568) ? YES :NO
#define IOS_4_7_Inch() ([[UIScreen mainScreen] bounds].size.height == 667) ? YES :NO
#define IOS_5_5_Inch() ([[UIScreen mainScreen] bounds].size.height == 736) ? YES :NO
#define IS_EQUAL_OR_MORE_THAN_IOS7() ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)
#define IS_EQUAL_OR_MORE_THAN_IOS8() ([[[UIDevice currentDevice] systemVersion] intValue] >= 8)
//应用版本号
#define VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)CFBundleShortVersionString]

#endif /* FunctionMacro_h */
