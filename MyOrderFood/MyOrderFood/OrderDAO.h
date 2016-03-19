//
//  OrderDAO.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataClass.h"
#import "OrderModel.h"
@interface OrderDAO : NSObject
+(void)updateData:(int)menuNum menuName:(NSString *)menuName remark:(NSString *)remark;
+(id)selectAllData:(OrderModel *)order;
+(void)insertData:(OrderModel *)order;
+(void)deleteAllData;
@end
