//
//  GroupRecordDAO.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataClass.h"
#import "GroupRecordModel.h"
@interface GroupRecordDAO : NSObject
+(void)insertData:(NSString *)room;
+(NSMutableArray *)selectAllData;
+(int)selectMaxId;
+(void)deleteSomeDataById:(int)groupRecordId;
+(void)deleteAllData;
@end
