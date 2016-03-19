//
//  OtherFoodViewController.h
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodInfoViewController.h"
#import "FoodOrderViewController.h"
#import "AppDelegateWindow.h"
@interface OtherFoodViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)infoButton:(id)sender;
- (IBAction)myOrderButton:(id)sender;
- (IBAction)orderFoodButton:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *titleImageView;
@property (retain, nonatomic) IBOutlet UITableView *foodTypeTableView;
@property (retain, nonatomic) IBOutlet UILabel *orderedFoodNum;
@property (retain, nonatomic) IBOutlet UIScrollView *foodScrollView;
@property(nonatomic,assign)int selectedRowOfOther;
@property(nonatomic,retain)NSMutableArray *groupArray;
- (IBAction)backButton:(id)sender;
@property(nonatomic,retain)FoodInfoViewController *foodInfo;
@end
