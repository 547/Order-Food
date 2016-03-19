//
//  RecordDAO.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataClass.h"
#import "RecordModel.h"
#import "OrderModel.h"
@interface RecordDAO : NSObject
+(void)insertData:(OrderModel *)order groupId:(int)groupId;
+(NSMutableArray *)selectAllData;
+(NSMutableArray *)selectDataByGroupId:(int)groupId;
@end
