//
//  DataClass.m
//  MyOrderFood
//
//  Created by HW on 16-1-7.
//  Copyright (c) 2016年 SevenDream. All rights reserved.
//

#import "DataClass.h"

@implementation DataClass
static FMDatabase *db=nil;
+(FMDatabase *)defaultData
{
    if (db==nil)
    {
//        db=[[FMDatabase databaseWithPath:[[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"]]retain];
        db=[[FMDatabase databaseWithPath:[self putDataToSandbox]]retain];
    }
    return db;
}
//将本地数据库用文件管理器复制到沙盒中
+(NSString *)putDataToSandbox
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[self getFilePath:@"database.sqlite"]])
    {
        /*
         1.先用资源束找到本地数据库的路径
         [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"]
         PS:在将数据库拖到工程文件中时要记得先编译==就是勾上Add to targets项的第一个选框。不然找出来的路径是空的。
         */
        NSString *path=[[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"];
        /*
         2.用文件管理器中的copyItemAtPath方法将本地数据库复制到目标路径
         第一个参数是原始路径
         */
      BOOL isOk=[fileManager copyItemAtPath:path toPath:[self getFilePath:@"database.sqlite"] error:nil];
        NSLog(@"%@",isOk?@"复制成功":@"复制失败");
        return isOk?[self getFilePath:@"database.sqlite"]:nil;
    }else
    {
        NSLog(@"该文件已经存在");
        return [self getFilePath:@"database.sqlite"];
    }
}
+(NSString *)getFilePath:(NSString *)fileName
{
   return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:fileName];
}
@end
