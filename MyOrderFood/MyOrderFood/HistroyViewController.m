//
//  HistroyViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "HistroyViewController.h"
#import "FoodOrderViewController.h"
#import "AppDelegateWindow.h"
#import "GroupRecordDAO.h"
#import "HistroyTableViewCell.h"
#import "RecordDAO.h"
#import "MyOrderViewController.h"
@interface HistroyViewController ()
{
    NSMutableArray *groupRecordArray;
}
@end

@implementation HistroyViewController
- (void)dealloc {
    [groupRecordArray release];
    [_historyTableView release];
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
    [self getData];
    [self setPageView];
}
-(void)getData
{
   NSMutableArray *array=[GroupRecordDAO selectAllData];
    if (array.count!=0)
    {
        groupRecordArray=array;
    }else
    {
        groupRecordArray=[[NSMutableArray alloc]initWithCapacity:0];
    }
}
-(void)setPageView
{
    self.historyTableView.delegate=self;
    self.historyTableView.dataSource=self;
    [self.historyTableView registerNib:[UINib nibWithNibName:@"HistroyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

//退出按钮
- (IBAction)exitButton:(id)sender
{
    FoodOrderViewController *foodOrder=[[FoodOrderViewController alloc]init];
    [AppDelegateWindow appWindowHaveAnimation:foodOrder animation:UIViewAnimationTransitionCurlDown];
    [foodOrder release];
}
//清空按钮
- (IBAction)cleanUpButton:(id)sender
{
    [GroupRecordDAO deleteAllData];
    [self getData];
    [self.historyTableView reloadData];
}
//单元格删除按钮
-(void)deleteButtonClicked:(UIButton *)button
{
    [GroupRecordDAO deleteSomeDataById:button.tag];
    [self getData];
    [self.historyTableView reloadData];
}
//单元格查阅按钮
-(void)selectButtonClicked:(UIButton *)button
{
    MyOrderViewController *myOrder=[[MyOrderViewController alloc]init];
    /**
     下面两种写法，虽然最终的效果都是一样的，但是第一种写法，大括号里的代码相较与第二种写法直接将代码写在presentViewController下面执行得更晚，效果不好；
     **/
    //写法一：
//    [self presentViewController:myOrder animated:YES completion:^{
//        NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
//        [notificationCenter postNotificationName:@"histroy" object:nil userInfo:nil];
//        NSLog(@"454646");
//    }];
    //写法二：
    [self presentViewController:myOrder animated:YES completion:nil];
    NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"histroy" object:nil userInfo:nil];
    NSLog(@"454646");
}
#pragma mark===UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return groupRecordArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistroyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    GroupRecordModel *groupRecord=[groupRecordArray objectAtIndex:indexPath.row];
    cell.dateLabel.text=groupRecord.date;
    cell.timeLabel.text=groupRecord.time;
    cell.roomLabel.text=groupRecord.room;
    cell.deleteButton.tag=groupRecord.groupRecordId;
    [cell.deleteButton addTarget:self action:@selector(deleteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectButton.tag=groupRecord.groupRecordId;
    [cell.selectButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
