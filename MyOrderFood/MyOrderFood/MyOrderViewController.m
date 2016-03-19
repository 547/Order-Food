//
//  MyOrderViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "MyOrderViewController.h"
#import "OrderTableViewCell.h"
#import "GroupRecordDAO.h"
#import "RecordDAO.h"
#import "OrderModel.h"
#import "OrderDAO.h"
#import "SendOrderViewController.h"
@interface MyOrderViewController ()
{
    NSMutableArray *dataArray;
    int dataArrayFlag;
}
@end

@implementation MyOrderViewController
- (void)dealloc
{
    [dataArray release];
    [_priceLabel release];
    [_orderTableView release];
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
     NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view from its nib.
    [self addSelfToNotificationCenter];
    
}
-(void)addSelfToNotificationCenter
{
    NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(changeDataArrayFlag:) name:@"histroy" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeDataArrayFlag:) name:@"OtherOrMain" object:nil];
}
-(void)changeDataArrayFlag:(NSNotification *)notification
{
    if ([notification.name isEqualToString:@"histroy"])
    {
        dataArrayFlag=1;
    }
    if ([notification.name isEqualToString:@"OtherOrMain"])
    {
        dataArrayFlag=2;
    }
    NSLog(@"=======flag==%d",dataArrayFlag);
    [self getData];
    [self setPageView];
    [self.orderTableView reloadData];
    [self changeView];
}
//获取数据库数据
-(void)getData
{
    if (dataArrayFlag==1)
    {
       NSMutableArray *array=[RecordDAO selectDataByGroupId:[GroupRecordDAO selectMaxId]];
        if (array.count>0)
        {
            dataArray=array;
        }else
        {
            dataArray=[[NSMutableArray alloc]initWithCapacity:0];
        }
    }
    if (dataArrayFlag==2)
    {
        NSMutableArray *array=[OrderDAO selectAllData:nil];
        if (array.count>0)
        {
            dataArray=array;
        }else
        {
            dataArray=[[NSMutableArray alloc]initWithCapacity:0];
        }
    }
}
-(void)setPageView
{
    self.orderTableView.delegate=self;
    self.orderTableView.dataSource=self;
    [self.orderTableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
//退出按钮
- (IBAction)exitButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//送单按钮
- (IBAction)sendOrderButton:(id)sender
{
    if (dataArray.count==0)
    {
        UIAlertView *orderAlert=[[UIAlertView alloc]initWithTitle:@"亲还没点菜n_n，快去点菜吧" message:nil delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil];
        [orderAlert show];
        [orderAlert release];
    }else
    {
        SendOrderViewController *sentOrder=[[SendOrderViewController alloc]init];
        [self presentViewController:sentOrder animated:YES completion:nil];
    }
}
//单元格删除按钮
-(void)deleteButtonClicked:(UIButton *)button
{
    NSLog(@"++++%d",button.tag);
}
-(void)changeView
{
    self.priceLabel.text=[NSString stringWithFormat:@"%d",[AccountPrice accountPrice:dataArray flag:dataArrayFlag]];
    if (dataArrayFlag==1)
    {
        [(UIButton *)[self.view viewWithTag:1000]removeFromSuperview];
    }
}
#pragma mark===UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (dataArrayFlag==2)
    {
        OrderModel *order=[dataArray objectAtIndex:indexPath.row];
        cell.orderIdLabel.text=[NSString stringWithFormat:@"%d",order.orderId];
        cell.nameLabel.text=order.menuName;
        cell.priceLabel.text=order.price;
        cell.kindLabel.text=order.kind;
        cell.menuNumTextField.text=[NSString stringWithFormat:@"%d",order.menuNum];
        cell.remarkTextField.text=order.remark;
        cell.deleteButton.tag=order.orderId;
        [cell.deleteButton addTarget:self action:@selector(deleteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (dataArrayFlag==1)
    {
        RecordModel *record=[dataArray objectAtIndex:indexPath.row];
        cell.orderIdLabel.text=[NSString stringWithFormat:@"%d",record.stateNum];
        cell.nameLabel.text=record.menuName;
        cell.priceLabel.text=record.menuPrice;
        cell.kindLabel.text=record.menuKind;
        cell.menuNumTextField.text=[NSString stringWithFormat:@"%d",record.menuNum];
        cell.remarkTextField.text=record.menuRemark;
         [cell.deleteButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    cell.userInteractionEnabled=YES;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    [self getData];
    [self.orderTableView reloadData];
    [self changeView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
@end
