//
//  FoodOrderViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "FoodOrderViewController.h"
#import "AppDelegateWindow.h"
#import "IndexViewController.h"
#import "HistroyViewController.h"
#import "ChineseFoodOrderViewController.h"
@interface FoodOrderViewController ()

@end

@implementation FoodOrderViewController

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
    
}
- (IBAction)foodOrderButton:(id)sender
{
    UIButton *button=(UIButton *)sender;
    if (button.tag==0)
    {
        //中文
        ChineseFoodOrderViewController *chinese=[[ChineseFoodOrderViewController alloc]init];
        [AppDelegateWindow appWindowHaveAnimation:chinese animation:UIViewAnimationTransitionCurlUp];
        [chinese release];
    }
    if (button.tag==1)
    {
        //英文
    }
    if (button.tag==2)
    {
        //返回
        IndexViewController *index=[[IndexViewController alloc]init];
        [AppDelegateWindow appWindowHaveAnimation:index animation:UIViewAnimationTransitionCurlDown];
        [index release];
    }
    if (button.tag==3)
    {
        //历史菜单
        HistroyViewController *history=[[HistroyViewController alloc]init];
        [AppDelegateWindow appWindowHaveAnimation:history animation:UIViewAnimationTransitionCurlUp];
        [history release];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
