//
//  HistroyViewController.h
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistroyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)exitButton:(id)sender;
- (IBAction)cleanUpButton:(id)sender;
@property (retain, nonatomic) IBOutlet UITableView *historyTableView;

@end
