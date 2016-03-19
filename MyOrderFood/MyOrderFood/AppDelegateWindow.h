//
//  AppDelegateWindow.h
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDelegateWindow : NSObject
+(void)appWindow:(UIViewController *)viewController;
+(void)appWindowHaveAnimation:(UIViewController *)viewController animation:(UIViewAnimationTransition)animation;
@end
