//
//  GroupRecordModel.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupRecordModel : NSObject
@property(nonatomic,assign)int groupRecordId;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *room;
+(id)createGroupRecordModel:(int)aGroupRecordId date:(NSString *)aDate time:(NSString *)aTime room:(NSString *)aRoom;
@end
