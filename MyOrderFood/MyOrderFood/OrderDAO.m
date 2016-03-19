//
//  OrderDAO.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "OrderDAO.h"

@implementation OrderDAO
//添加数据
+(void)insertData:(OrderModel *)order
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        NSLog(@"数据打开失败");
        return;
    }
   int selectedMenuNum=[[self selectAllData:order]intValue];
    if (selectedMenuNum!=0)
    {
        [self updateData:selectedMenuNum+1 menuName:order.menuName remark:nil];
    }else
    {
        BOOL isOk=[db executeUpdate:@"INSERT INTO orderTable (menuName,Price,kind,menuNum) VALUES (?,?,?,?)",order.menuName,order.price,order.kind,[NSNumber numberWithInt:order.menuNum]];
        NSLog(@"%@",isOk?@"添加成功":@"添加失败");
        [db close];
    }
}
//查找数据
+(id)selectAllData:(OrderModel *)order
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        NSLog(@"数据打开失败");
        return nil;
    }
    if (order==nil)
    {
        NSMutableArray *array=[[NSMutableArray alloc]init];
        FMResultSet *result=[db executeQuery:@"SELECT * FROM orderTable"];
        while ([result next])
        {
            OrderModel *orderModel=[OrderModel createOrderModel:[result intForColumnIndex:0] menuName:[result stringForColumnIndex:1] price:[result stringForColumnIndex:2] kind:[result stringForColumnIndex:3] menuNum:[result intForColumnIndex:4] remark:[result stringForColumnIndex:5]];
            [array addObject:orderModel];
        }
        [result close];
        [db close];
        return array;
    }else
    {
    FMResultSet *result=[db executeQuery:@"SELECT menuNum FROM orderTable WHERE menuName=?",order.menuName];
        while ([result next])
        {
            
            return [NSNumber numberWithInt:[result intForColumnIndex:0]];
        }
        return [NSNumber numberWithInt:0];
    }
}
//修改数据
+(void)updateData:(int)menuNum menuName:(NSString *)menuName remark:(NSString *)remark
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        NSLog(@"数据打开失败");
        return;
    }
    if (remark.length==0)
    {
        BOOL isOk=[db executeUpdate:@"UPDATE orderTable SET menuNum=? WHERE menuName=?",[NSNumber numberWithInt:menuNum],menuName];
        NSLog(@"%@",isOk?@"修改成功":@"修改失败");
    }else
    {
        BOOL isOk=[db executeUpdate:@"UPDATE orderTable SET menuNum=? remark=? WHERE menuName=?",[NSNumber numberWithInt:menuNum],remark,menuName];
        NSLog(@"%@",isOk?@"修改成功":@"修改失败");
    }
    [db close];
}
+(void)deleteAllData
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        NSLog(@"数据打开失败");
        return;
    }
    BOOL isOk=[db executeUpdate:@"DELETE FROM orderTable"];
    NSLog(@"%@",isOk?@"删除成功":@"删除失败");
    [db close];
}
@end
