//
//  GroupRecordDAO.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "GroupRecordDAO.h"

@implementation GroupRecordDAO
+(NSMutableArray *)selectAllData
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        NSLog(@"数据打开失败");
        return nil;
    }
    NSMutableArray *array=[[NSMutableArray alloc]init];
   FMResultSet *result=[db executeQuery:@"SELECT * FROM group_recordTable"];
    while ([result next])
    {
        GroupRecordModel *group=[GroupRecordModel createGroupRecordModel:[result intForColumnIndex:0] date:[result stringForColumnIndex:1] time:[result stringForColumnIndex:2] room:[result stringForColumnIndex:3]];
        [array addObject:group];
    }
    [db close];
    return array;
}
+(void)insertData:(NSString *)room
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        NSLog(@"数据打开失败");
        return;
    }
    NSDate *myDate=[NSDate date];
    NSDateFormatter *forMatter=[[NSDateFormatter alloc]init];
    [forMatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *data=[forMatter stringFromDate:myDate];
    [forMatter setDateFormat:@"HH:mm:ss"];
    NSString *time=[forMatter stringFromDate:myDate];
    [forMatter release];
    BOOL isOk=[db executeUpdate:@"INSERT INTO group_recordTable (date,time,room) VALUES (?,?,?)",data,time,room];
    NSLog(@"%@",isOk?@"添加成功":@"添加失败");
    [db close];
}
+(int)selectMaxId
{
    int maxId=0;
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        return maxId;
    }
   FMResultSet *result=[db executeQuery:@"SELECT MAX(id) FROM group_recordTable"];
    while ([result next])
    {
        maxId=[result intForColumnIndex:0];
    }
    [result close];
    [db close];
    return maxId;
}
+(void)deleteAllData
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        return;
    }
   BOOL isOk=[db executeUpdate:@"DELETE FROM group_recordTable"];
    NSLog(@"%@",isOk?@"删除成功":@"删除失败");
    [db close];
}
+(void)deleteSomeDataById:(int)groupRecordId
{
    FMDatabase *db=[DataClass defaultData];
    if (![db open])
    {
        [db close];
        return;
    }
    BOOL isOk=[db executeUpdate:@"DELETE FROM group_recordTable WHERE id=?",[NSNumber numberWithInt:groupRecordId]];
    NSLog(@"%@",isOk?@"删除成功":@"删除失败");
    [db close];
}

@end
