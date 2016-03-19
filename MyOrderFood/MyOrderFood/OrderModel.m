//
//  OrderModel.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel
-(void)dealloc
{
    [_menuName release];
    _menuName=nil;
    [_price release];
    _price=nil;
    [_kind release];
    _kind=nil;
    [_remark release];
    _remark=nil;
    [super dealloc];
}
+(id)createOrderModel:(int)aOrderId menuName:(NSString *)aMenuName price:(NSString *)aPrice kind:(NSString *)aKind menuNum:(int)aMenuNum remark:(NSString *)aRemark
{
  OrderModel *order =[[OrderModel alloc]init];
    order.orderId=aOrderId;
    order.menuName=aMenuName;
    order.price=aPrice;
    order.kind=aKind;
    order.menuNum=aMenuNum ;
    order.remark=aRemark;
    return order;
}
@end
