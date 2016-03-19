//
//  GroupDAO.h
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataClass.h"
#import "GroupModel.h"
@interface GroupDAO : NSObject
+(NSMutableArray *)queryDataById:(int)groupId;
+(NSMutableArray *)queryAllData;
@end
