//
//  GroupModel.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "GroupModel.h"

@implementation GroupModel
-(void)dealloc
{
    [_kind release];
    _kind=nil;
    [_name release];
    _name=nil;
    [_imageName release];
    _imageName=nil;
    [_highlighted_image release];
    _highlighted_image=nil;
    [super dealloc];
}
+(id)createGroupModel:(int)aGroupId kind:(NSString *)aKind name:(NSString *)aName image:(NSString *)aImage highlighted_image:(NSString *)aHighlighted_image
{
    GroupModel *group=[[GroupModel alloc]init];
    group.groupId=aGroupId;
    group.kind=aKind;
    group.name=aName;
    group.imageName=aImage;
    group.highlighted_image=aHighlighted_image;
    return group;
}

@end
