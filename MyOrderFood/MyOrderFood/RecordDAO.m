//
//  RecordDAO.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "RecordDAO.h"

@implementation RecordDAO
+(void)insertData:(OrderModel *)order groupId:(int)groupId
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        return;
    }
    if (order.remark.length==0)
    {
        order.remark=@"";
    }
    BOOL isOk=[db executeUpdate:@"INSERT INTO recordTable (stateNum,menuName,menuPrice,menuKind,menuNum,menuRemark,groupID) VALUES (?,?,?,?,?,?,?)",[NSNumber numberWithInt:order.orderId],order.menuName,order.price,order.kind,[NSNumber numberWithInt:order.menuNum],order.remark,[NSNumber numberWithInt:groupId]];
    NSLog(@"%@",isOk?@"添加成功":@"添加失败");
    [db close];
}
+(NSMutableArray *)selectAllData
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        return nil;
    }
    FMResultSet *result=[db executeQuery:@"SELECT *FROM recordTable"];
     NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:0];
    while ([result next])
    {
        RecordModel *record=[RecordModel createRecordModel:[result intForColumnIndex:0] stateNum:[result intForColumnIndex:1] menuName:[result stringForColumnIndex:2] menuPrice:[result stringForColumnIndex:3] menuKind:[result stringForColumnIndex:4] menuNum:[result intForColumnIndex:5] menuRemark:[result stringForColumnIndex:6] groupId:[result intForColumnIndex:7]];
        [array addObject:record];
    }
    [db close];
    return array;
}
+(NSMutableArray *)selectDataByGroupId:(int)groupId
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        return nil;
    }
   FMResultSet *result=[db executeQuery:@"SELECT * FROM recordTable WHERE groupID=?",[NSNumber numberWithInt:groupId]];
    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:0];
    while ([result next])
    {
      RecordModel *record=[RecordModel createRecordModel:[result intForColumnIndex:0] stateNum:[result intForColumnIndex:1] menuName:[result stringForColumnIndex:2] menuPrice:[result stringForColumnIndex:3] menuKind:[result stringForColumnIndex:4] menuNum:[result intForColumnIndex:5] menuRemark:[result stringForColumnIndex:6] groupId:[result intForColumnIndex:7]];
        [array addObject:record];
    }
    [result close];
    [db close];
    return array;
}
@end
