//
//  AppDelegateWindow.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "AppDelegateWindow.h"
#import "AppDelegate.h"
@implementation AppDelegateWindow
+(void)appWindowHaveAnimation:(UIViewController *)viewController animation:(UIViewAnimationTransition)animation
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    app.window.rootViewController=viewController;
    [UIView animateWithDuration:1 animations:^{
        [UIView setAnimationTransition:animation forView:app.window cache:YES];
    }];
}
+(void)appWindow:(UIViewController *)viewController
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    app.window.rootViewController=viewController;
}
@end
