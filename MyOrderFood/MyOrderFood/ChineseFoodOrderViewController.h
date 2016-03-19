//
//  ChineseFoodOrderViewController.h
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OtherFoodViewController.h"
@interface ChineseFoodOrderViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UITableView *littleTableView;
@property(nonatomic,retain) OtherFoodViewController *otherFoodViewController;
@end
