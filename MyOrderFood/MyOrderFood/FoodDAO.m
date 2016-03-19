//
//  FoodDAO.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "FoodDAO.h"

@implementation FoodDAO
+(NSMutableArray *)selectAllDataByiKind:(NSString *)kind
{
    NSMutableArray *array=[[NSMutableArray alloc]initWithCapacity:0];
    FMDatabase *db=[DataClass defaultData];
    if ([db open])
    {
       FMResultSet *result=[db executeQuery:@"SELECT * FROM menuTable WHERE iKind=?",kind];
        while ([result next])
        {
            FoodModel *food=[FoodModel createFoodModel:[result intForColumnIndex:0] groupId:[result intForColumnIndex:1] iKind:[result stringForColumnIndex:2] name:[result stringForColumnIndex:3] price:[result intForColumnIndex:4] unit:[result stringForColumnIndex:5] detail:[result stringForColumnIndex:6] picName:[result stringForColumnIndex:7]];
            [array addObject:food];
        }
        [result close];
        [db close];
    }else
    {
        [db close];
    }
    NSLog(@"a=====%@",array);
    return array;
}
@end
