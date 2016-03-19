//
//  GroupDAO.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "GroupDAO.h"

@implementation GroupDAO
//查所有数据
+(NSMutableArray *)queryAllData
{
    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:0];
    FMDatabase *db=[DataClass defaultData];
    if ([db open])
    {
        FMResultSet *result=[db executeQuery:@"SELECT * FROM groupTable"];
        while ([result next])
        {
            GroupModel *group=[GroupModel createGroupModel:[result intForColumnIndex:0] kind:[result stringForColumnIndex:1] name:[result stringForColumnIndex:2] image:[result stringForColumnIndex:3] highlighted_image:[result stringForColumnIndex:4]];
            [array addObject:group];
        }
        [result close];
        [db close];
    } else
    {
        [db close];
    }
    return array;
}
//通过Id查所有数据
+(NSMutableArray *)queryDataById:(int)groupId
{
    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:0];
    FMDatabase *db=[DataClass defaultData];
    if ([db open])
    {
        FMResultSet *result=[db executeQuery:@"SELECT * FROM groupTable WHERE id=?",[NSNumber numberWithInt:groupId]];
        while ([result next])
        {
            GroupModel *group=[GroupModel createGroupModel:[result intForColumnIndex:0] kind:[result stringForColumnIndex:1] name:[result stringForColumnIndex:2] image:[result stringForColumnIndex:3] highlighted_image:[result stringForColumnIndex:4]];
            [array addObject:group];
        }
        [result close];
        [db close];
    } else
    {
        [db close];
    }
    return array;
}

@end
