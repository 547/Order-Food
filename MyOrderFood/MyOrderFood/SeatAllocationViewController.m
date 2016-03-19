//
//  SeatAllocationViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "SeatAllocationViewController.h"

@interface SeatAllocationViewController ()
{
    NSArray *roomArray;
    
}
@end

@implementation SeatAllocationViewController

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
    [self setData];
}
-(void)setData
{
    roomArray=[@[@"文华轩",@"希尔顿",@"威斯汀"]retain];
}
//选定按钮
- (IBAction)selectedButton:(id)sender
{
    
}
//点击房间
- (IBAction)selectRoom:(id)sender
{
    UIButton *button=(UIButton *)sender;
    self.buttonName=[roomArray objectAtIndex:button.tag];
    [self dismissViewControllerAnimated:YES completion:nil];
}
//退出按钮
- (IBAction)exitButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_buttonName release];
    [roomArray release];
    [super dealloc];
}

@end
