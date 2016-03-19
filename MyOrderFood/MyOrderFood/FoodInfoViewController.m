//
//  FoodInfoViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-8.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "FoodInfoViewController.h"

@interface FoodInfoViewController ()

@end

@implementation FoodInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setPageView];
}
-(void)setPageView
{
//设置半透明背景方法一：
//    UIColor *color=[UIColor blueColor];
//    self.view.backgroundColor=[color colorWithAlphaComponent:0.1];
    //设置半透明背景方法二：
    self.view.backgroundColor=[UIColor colorWithRed:0.2 green:0.1 blue:0.4 alpha:0.3];
    [self.exitButton addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
    self.foodImageView.image=[UIImage imageNamed:self.food.picName];
    self.foodNameLabel.text=self.food.name;
}
//点击退出按钮
-(void)exit
{
    [self.view removeFromSuperview];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_food release];
    [_foodImageView release];
    [_foodNameLabel release];
    [_exitButton release];
    [_backImageView release];
    [super dealloc];
}

@end
