//
//  RecordModel.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "RecordModel.h"
@implementation RecordModel
-(void)dealloc
{
    [_menuName release];
    [_menuPrice release];
    [_menuKind release];
    [_menuRemark release];
    [super dealloc];
}
+(id)createRecordModel:(int)aRecordId stateNum:(int)aSateNum menuName:(NSString *)aMenuName menuPrice:(NSString *)aMenuPrice menuKind:(NSString *)aMenuKind menuNum:(int)aMenuNum menuRemark:(NSString *)aMenuRemark groupId:(int)aGroupId
{
    RecordModel *record=[[RecordModel alloc]init];
    record.recordId=aRecordId;
    record.stateNum=aSateNum;
    record.menuName=aMenuName;
    record.menuPrice=aMenuPrice;
    record.menuKind=aMenuKind;
    record.menuNum=aMenuNum;
    record.menuRemark=aMenuRemark;
    record.groupId=aGroupId;
    return record;
}
@end
