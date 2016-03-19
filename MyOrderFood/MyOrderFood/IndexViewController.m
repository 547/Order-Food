//
//  IndexViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "IndexViewController.h"
#import "FoodOrderViewController.h"
#import "AppDelegateWindow.h"
@interface IndexViewController ()

@end

@implementation IndexViewController

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
- (IBAction)indexButton:(id)sender
{
    UIButton *button=(UIButton *)sender;
    if (button.tag==0)
    {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    }else
    {
        FoodOrderViewController *foodOrder=[[FoodOrderViewController alloc]init];
        [AppDelegateWindow appWindowHaveAnimation:foodOrder animation:UIViewAnimationTransitionCurlUp];
                   [foodOrder release];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
