//
//  AccountPrice.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "AccountPrice.h"
#import "OrderModel.h"

@implementation AccountPrice
+(int)accountPrice:(NSMutableArray *)array flag:(int)flag
{
    int count=0;
    if (flag==1)
    {
        for (RecordModel *record in array)
        {
            count+=[record.menuPrice intValue]*record.menuNum;
        }
    }else
    {
        for (OrderModel *order in array)
        {
            count+=[order.price intValue]*order.menuNum;
        }
    }
    return count;
}
@end
