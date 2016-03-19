//
//  GroupRecordModel.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "GroupRecordModel.h"

@implementation GroupRecordModel
-(void)dealloc
{
    [_date release];
    [_time release];
    [_room release];
    [super dealloc];
}
+(id)createGroupRecordModel:(int)aGroupRecordId date:(NSString *)aDate time:(NSString *)aTime room:(NSString *)aRoom
{
    GroupRecordModel *group=[[GroupRecordModel alloc]init];
    group.groupRecordId=aGroupRecordId;
    group.date=aDate;
    group.time=aTime;
    group.room=aRoom;
    return group;
}
@end
