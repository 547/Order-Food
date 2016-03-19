//
//  SendOrderViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "SendOrderViewController.h"
#import "SeatAllocationViewController.h"
#import "GroupRecordModel.h"
#import "GroupRecordDAO.h"
#import "OrderDAO.h"
#import "OrderModel.h"
#import "RecordDAO.h"
@interface SendOrderViewController ()
{
    SeatAllocationViewController *seatAllocation;
}
@end

@implementation SendOrderViewController
- (void)dealloc
{
    [seatAllocation release];
    [_selectSeatButton release];
    [super dealloc];
}
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
-(NSMutableArray *)getData
{
    NSMutableArray *orderArray=[[NSMutableArray alloc]init];
    orderArray=[OrderDAO selectAllData:nil];
    return [orderArray autorelease];
}
-(void)setPageView
{
    [self.selectSeatButton addTarget:self action:@selector(selectSeatButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}
//餐位选择
-(void)selectSeatButtonClicked:(UIButton *)button
{
    seatAllocation=[[SeatAllocationViewController alloc]init];
    [self presentViewController:seatAllocation animated:YES completion:nil];
}
//送单按钮
- (IBAction)sendOrderButton:(id)sender
{
    [GroupRecordDAO insertData:seatAllocation.buttonName];
    for (OrderModel *order in [self getData])
    {
        NSLog(@"=======%@",order.remark);
         [RecordDAO insertData:order groupId:[GroupRecordDAO selectMaxId]];
    }
    [OrderDAO deleteAllData];
    [self dismissViewControllerAnimated:YES completion:nil];
}
//退出按钮
- (IBAction)exitButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    if (seatAllocation.buttonName.length==0)
    {
        [self.selectSeatButton setTitle:@"" forState:UIControlStateNormal];
    }else
    {
    [self.selectSeatButton setTitle:seatAllocation.buttonName forState:UIControlStateNormal];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
