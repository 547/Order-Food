//
//  RecordModel.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface RecordModel : NSObject
@property(nonatomic,assign)int recordId;
@property(nonatomic,assign)int stateNum;
@property(nonatomic,copy)NSString *menuName;
@property(nonatomic,copy)NSString *menuPrice;
@property(nonatomic,copy)NSString *menuKind;
@property(nonatomic,assign)int menuNum;
@property(nonatomic,copy)NSString *menuRemark;
@property(nonatomic,assign)int groupId;
+(id)createRecordModel:(int)aRecordId stateNum:(int)aSateNum menuName:(NSString *)aMenuName menuPrice:(NSString *)aMenuPrice menuKind:(NSString *)aMenuKind menuNum:(int)aMenuNum menuRemark:(NSString *)aMenuRemark groupId:(int)aGroupId;
@end
