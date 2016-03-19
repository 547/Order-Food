//
//  SeatAllocationViewController.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeatAllocationViewController : UIViewController
- (IBAction)selectedButton:(id)sender;
- (IBAction)selectRoom:(id)sender;
- (IBAction)exitButton:(id)sender;
@property(nonatomic,copy)NSString *buttonName;
@end
