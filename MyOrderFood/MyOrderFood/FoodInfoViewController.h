//
//  FoodInfoViewController.h
//  MyOrderFood
//
//  Created by HW on 16-1-8.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodModel.h"
@protocol FoodInfoViewControllerDelegate;
@interface FoodInfoViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *backImageView;
@property(nonatomic,retain)id<FoodInfoViewControllerDelegate>delegate;
@property(nonatomic,retain)FoodModel *food;
@property (retain, nonatomic) IBOutlet UIImageView *foodImageView;
@property (retain, nonatomic) IBOutlet UILabel *foodNameLabel;
@property (retain, nonatomic) IBOutlet UIButton *exitButton;


@end
@protocol FoodInfoViewControllerDelegate <NSObject>
@required
@optional
-(void)removeSelfViewFromSupView:(UIView *)supView;
@end