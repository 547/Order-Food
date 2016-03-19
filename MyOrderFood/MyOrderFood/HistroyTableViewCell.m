//
//  HistroyTableViewCell.m
//  MyOrderFood
//
//  Created by HW on 16-1-9.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "HistroyTableViewCell.h"

@implementation HistroyTableViewCell

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
    [_deleteButton release];
    [_dateLabel release];
    [_timeLabel release];
    [_roomLabel release];
    [_selectButton release];
    [super dealloc];
}
@end
