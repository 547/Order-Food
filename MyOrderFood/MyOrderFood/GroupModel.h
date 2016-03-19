//
//  GroupModel.h
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject

@property(nonatomic,assign)int groupId;
@property(nonatomic,copy)NSString *kind;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)NSString *highlighted_image;
+(id)createGroupModel:(int)aGroupId kind:(NSString *)aKind name:(NSString *)aName image:(NSString *)aImage highlighted_image:(NSString *)aHighlighted_image;

@end
