//
//  OtherFoodViewController.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "OtherFoodViewController.h"
#import "FoodTableViewCell.h"
#import "FoodModel.h"
#import "FoodDAO.h"
#import "GroupModel.h"
#import "FoodTableViewHeader.h"
#import "FoodInfoViewController.h"
#import "AppDelegateWindow.h"
#import "OrderDAO.h"
#import "OrderModel.h"
#import "MyOrderViewController.h"
#define scrollWidth self.foodScrollView.frame.size.width
#define scrollHeight self.foodScrollView.frame.size.height
@interface OtherFoodViewController ()
{
    NSMutableArray *foodArray;
    NSArray *kindArray;
    int shouldOpen;
}
@end

@implementation OtherFoodViewController
- (void)dealloc
{
    [_foodInfo release];
    [kindArray release];
    [foodArray release];
    [_groupArray release];
    [_titleImageView release];
    [_foodTypeTableView release];
    [_foodScrollView release];
    [_orderedFoodNum release];
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
    [self createMemory];
    [self getData];
    [self setPageView];
}
-(void)createMemory
{
    foodArray=[[NSMutableArray alloc]initWithCapacity:0];
}
-(void)setPageView
{
    self.titleImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%dicon.png",self.selectedRowOfOther+1]];
    self.foodTypeTableView.rowHeight=44;
    self.foodTypeTableView.delegate=self;
    self.foodTypeTableView.dataSource=self;
    self.foodTypeTableView.backgroundColor=[UIColor clearColor];
    self.foodTypeTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.foodTypeTableView registerNib:[UINib nibWithNibName:@"FoodTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.foodTypeTableView registerNib:[UINib nibWithNibName:@"FoodTableViewHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"head"];
    self.foodScrollView.layer.cornerRadius=8;
    self.foodScrollView.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.foodScrollView.pagingEnabled=YES;
    self.foodScrollView.layer.borderWidth=1;
    self.foodScrollView.clipsToBounds=YES;
    self.foodScrollView.delegate=self;
    [self setFoodScrollViewContentView];
}
-(void)setFoodScrollViewContentView
{
    [self.foodScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSArray *array=[foodArray objectAtIndex:shouldOpen];
    self.foodScrollView.contentSize=CGSizeMake(scrollWidth*array.count, scrollHeight);
    self.foodScrollView.contentOffset=CGPointMake(0, 0);
    for (int i=0; i<array.count; i++)
    {
        FoodModel *food=[array objectAtIndex:i];
        UIImageView *scrollViewImageView=[[UIImageView alloc]initWithFrame:CGRectMake(scrollWidth*i, 0, scrollWidth, scrollHeight)];
        scrollViewImageView.image=[UIImage imageNamed:food.picName];
        [self.foodScrollView addSubview:scrollViewImageView];
        [scrollViewImageView release];
    }
}
-(void)getData
{
    GroupModel *group=[self.groupArray objectAtIndex:self.selectedRowOfOther];
    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:0];
    kindArray=[[group.name componentsSeparatedByString:@"|"]retain];
    for (NSString *kind in kindArray)
    {
       array=[FoodDAO selectAllDataByiKind:kind];
        [foodArray addObject:array];
    }
    [array release];
}
//返回按钮
- (IBAction)backButton:(id)sender
{
    FoodOrderViewController *foodOrder=[[FoodOrderViewController alloc]init];
    [AppDelegateWindow appWindowHaveAnimation:foodOrder animation:UIViewAnimationTransitionCurlDown];
    [foodOrder release];
}
// 我的菜单
- (IBAction)myOrderButton:(id)sender
{
    MyOrderViewController *myOrder=[[MyOrderViewController alloc]init];
    [self presentViewController:myOrder animated:YES completion:nil];
    NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"OtherOrMain" object:nil];
    [myOrder release];
}
//点菜
- (IBAction)orderFoodButton:(id)sender
{
   FoodModel *food=[[foodArray objectAtIndex:shouldOpen]objectAtIndex:self.foodScrollView.contentOffset.x/scrollWidth];
    NSLog(@"+++++++%@",food.iKind);
    [OrderDAO insertData:[OrderModel createOrderModel:0 menuName:food.name price:[NSString stringWithFormat:@"%d",food.price] kind:food.iKind menuNum:1 remark:nil]];
}
//详情
- (IBAction)infoButton:(id)sender
{
    [self.foodInfo.view removeFromSuperview];
    FoodInfoViewController *foodInfoView=[[FoodInfoViewController alloc]init];
    //根据展开的区头和foodScrollView的偏移量获取foodModel对象，然后赋给FoodInfoViewController的food属性
    foodInfoView.food=[[foodArray objectAtIndex:shouldOpen]objectAtIndex:self.foodScrollView.contentOffset.x/scrollWidth];
    //用模态弹出的方法弹出的页面不会全屏，会在顶部留20像素显示状态栏，所以做半透明效果不好
//    [foodInfo setModalPresentationStyle:UIModalPresentationFullScreen];
//    [self presentViewController:foodInfo animated:YES completion:nil];
    //用更改window的根视图的方法跳转页面，设置的半透明背景不起作用
//    AppDelegate *app=[UIApplication sharedApplication].delegate;
//    app.window.rootViewController=foodInfo;
    //直接将要显示的页面的View作为子视图加到当前页面的View上[self.view addSubview:foodInfo.view]，在配合设置半透明背景的方法，就可以出现半透明背景的View
//    [foodInfo.exitButton addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    self.foodInfo=foodInfoView;
    [self.view addSubview:self.foodInfo.view];
    [foodInfoView release];
}
//点击区头按钮
-(void)openOrClose:(UIButton *)button
{
    shouldOpen=button.tag;
    [self.foodTypeTableView reloadData];
    [self setFoodScrollViewContentView];
}
#pragma mark===UIScrollView
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.contentOffset.x>scrollView.contentSize.width-scrollWidth)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"后面没有了哦" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil];
        //下面的设置了对UIAlertView不起作用
//        alert.center=CGPointMake(self.view.center.x+alert.frame.size.width*0.5, self.view.center.y);
//        [self.foodScrollView addSubview:alert];
        [alert show];
        [alert release];
    }
    if (scrollView.contentOffset.x<0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"这就是第一页" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int shouldSettingOutRow=scrollView.contentOffset.x/scrollWidth;
    FoodTableViewCell *cell=(FoodTableViewCell *)[self.foodTypeTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:shouldSettingOutRow inSection:shouldOpen]];
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cell cache:YES];
    }];
}
#pragma mark===UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return foodArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (shouldOpen==section)
    {
        return [[foodArray objectAtIndex:section]count];
    }
    else
    {
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    FoodModel *food=[[foodArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    cell.nameLabel.textColor=[UIColor whiteColor];
    cell.nameLabel.text=food.name;
    cell.priceLabel.textColor=[UIColor yellowColor];
    cell.priceLabel.text=[NSString stringWithFormat:@"%d/%@",food.price,food.unit];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FoodTableViewHeader *headerView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"head"];
    headerView.nameLabel.textColor=[UIColor whiteColor];
    headerView.nameLabel.text=[kindArray objectAtIndex:section];
    headerView.headerButton.tag=section;
    [headerView.headerButton addTarget:self action:@selector(openOrClose:) forControlEvents:UIControlEventTouchUpInside];
    return headerView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cell cache:YES];
    }];
    
//    self.foodScrollView.contentOffset=CGPointMake(scrollWidth*indexPath.row, 0);
    [self.foodScrollView setContentOffset:CGPointMake(scrollWidth*indexPath.row, 0) animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
