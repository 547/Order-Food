//
//  FoodDAO.h
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodModel.h"
#import "DataClass.h"
@interface FoodDAO : NSObject
+(NSMutableArray *)selectAllDataByiKind:(NSString *)kind;
@end
