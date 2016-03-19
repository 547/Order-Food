//
//  OrderTableViewCell.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_orderIdLabel release];
    [_nameLabel release];
    [_kindLabel release];
    [_priceLabel release];
    [_menuNumTextField release];
    [_remarkTextField release];
    [_deleteButton release];
    [super dealloc];
}
@end
