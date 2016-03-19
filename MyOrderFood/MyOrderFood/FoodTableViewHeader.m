//
//  FoodTableViewHeader.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "FoodTableViewHeader.h"

@implementation FoodTableViewHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [_nameLabel release];
    [_headerButton release];
    [super dealloc];
}
@end
