//
//  OrderModel.h
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject
@property(nonatomic,assign)int orderId;
@property(nonatomic,copy)NSString *menuName;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *kind;
@property(nonatomic,assign)int menuNum;
@property(nonatomic,copy)NSString *remark;
+(id)createOrderModel:(int)aOrderId menuName:(NSString *)aMenuName price:(NSString *)aPrice kind:(NSString *)aKind menuNum:(int)aMenuNum remark:(NSString *)aRemark;
@end
