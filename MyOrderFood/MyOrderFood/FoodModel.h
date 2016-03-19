//
//  FoodModel.h
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodModel : NSObject
@property(nonatomic,assign)int foodId;
@property(nonatomic,assign)int groupId;
@property(nonatomic,copy)NSString *iKind;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int price;
@property(nonatomic,copy)NSString *unit;
@property(nonatomic,copy)NSString *detail;
@property(nonatomic,copy)NSString *picName;
+(id)createFoodModel:(int)aFoodId groupId:(int)aGroupId iKind:(NSString *)aIKind name:(NSString *)aName price:(int)aPrice unit:(NSString *)aUnit detail:(NSString *)aDetail picName:(NSString *)aPieName;
@end
