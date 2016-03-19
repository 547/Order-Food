//
//  SendOrderViewController.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendOrderViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *selectSeatButton;
- (IBAction)sendOrderButton:(id)sender;
- (IBAction)exitButton:(id)sender;

@end
