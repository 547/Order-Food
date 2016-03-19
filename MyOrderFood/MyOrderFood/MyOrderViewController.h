//
//  MyOrderViewController.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountPrice.h"
@interface MyOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)exitButton:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *priceLabel;
@property (retain, nonatomic) IBOutlet UITableView *orderTableView;
- (IBAction)sendOrderButton:(id)sender;

@end
