//
//  ChineseFoodOrderViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "ChineseFoodOrderViewController.h"
#import "GroupModel.h"
#import "GroupDAO.h"
#import "OtherFoodViewController.h"
#import "MainCookerCommendViewController.h"
@interface ChineseFoodOrderViewController ()
{
    NSMutableArray *littleTableArray;
    NSInteger selectedRow;
    
}
@end

@implementation ChineseFoodOrderViewController
- (void)dealloc {
    [_otherFoodViewController release];
    [littleTableArray release];
    [_littleTableView release];
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
    [self setTableView];
}
-(void)setTableView
{
    self.littleTableView.delegate=self;
    self.littleTableView.dataSource=self;
    self.littleTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.littleTableView.backgroundColor=[UIColor clearColor];
    [self.littleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.littleTableView.rowHeight=102;
    [self getData];
    [self setMainCookerCommendView];
}
-(void)getData
{
   NSMutableArray *array=[GroupDAO queryAllData];
    if (array.count>0)
    {
        littleTableArray=array;
    }else
    {
        littleTableArray=[[NSMutableArray alloc]initWithCapacity:0];
    }
}
-(void)setMainCookerCommendView
{
    [self.otherFoodViewController.view removeFromSuperview];
    MainCookerCommendViewController *mainCookerCommendView=[[MainCookerCommendViewController alloc]init];
    mainCookerCommendView.selectedRowOfOther=0;
    mainCookerCommendView.groupArray=littleTableArray;
    self.otherFoodViewController=mainCookerCommendView;
    [self.view addSubview:self.otherFoodViewController.view];
    [mainCookerCommendView release];
    [self.view bringSubviewToFront:self.littleTableView];
}
#pragma mark===UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return littleTableArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    GroupModel *group=[littleTableArray objectAtIndex:indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    cell.imageView.frame=CGRectMake(0, 0, tableView.frame.size.width, tableView.rowHeight);
    if (selectedRow==indexPath.row)
    {
            cell.imageView.image=[UIImage imageNamed:group.highlighted_image];
    }else
    {
        cell.imageView.image=[UIImage imageNamed:group.imageName];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row!=0)
    {
        selectedRow=indexPath.row;
        [self.littleTableView reloadData];
        [self.otherFoodViewController.view removeFromSuperview];
        OtherFoodViewController *otherFoodView=[[OtherFoodViewController alloc]init];
        //把当前页选中的行传到OtherFoodViewController
        otherFoodView.selectedRowOfOther=indexPath.row;
        otherFoodView.groupArray=littleTableArray;
        self.otherFoodViewController=otherFoodView;
        [self.view addSubview:self.otherFoodViewController.view];
        [otherFoodView release];
    }else
    {
        [self setMainCookerCommendView];
    }
    
    [self.view bringSubviewToFront:self.littleTableView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
