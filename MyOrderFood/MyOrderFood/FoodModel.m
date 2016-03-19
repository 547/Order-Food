//
//  FoodModel.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel
-(void)dealloc
{
    [_iKind release];
    _iKind=nil;
    [_name release];
    _name=nil;
    [_unit release];
    _unit=nil;
    [_detail release];
    _detail=nil;
    [_picName release];
    _picName=nil;
    [super dealloc];
}
+(id)createFoodModel:(int)aFoodId groupId:(int)aGroupId iKind:(NSString *)aIKind name:(NSString *)aName price:(int)aPrice unit:(NSString *)aUnit detail:(NSString *)aDetail picName:(NSString *)aPieName
{
    FoodModel *food=[[FoodModel alloc]init];
    food.foodId=aFoodId;
    food.groupId=aGroupId;
    food.iKind=aIKind;
    food.name=aName;
    food.price=aPrice;
    food.unit=aUnit;
    food.detail=aDetail;
    food.picName=aPieName;
    return food;
}
@end
