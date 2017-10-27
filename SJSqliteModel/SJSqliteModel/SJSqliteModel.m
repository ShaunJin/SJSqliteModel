//
//  SJSqliteModel.m
//  SJSqliteModelDemo
//
//  Created by ShaJin on 2017/10/27.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#import "SJSqliteModel.h"
#import <sqlite3.h>
@implementation SJSqliteModel
+(instancetype)shareInstance{
    return [SJSqliteModel new];
}
-(BOOL)creatDataBase{
    NSString *desktop = @"/Users/apple/Desktop";
    NSString *fileName = @"db";
    NSString *path = [NSString stringWithFormat:@"%@/%@",desktop,fileName];
    sqlite3 *db;
    int result = sqlite3_open(path.UTF8String, &db);
    if (result == SQLITE_OK) {
        NSLog(@"成功");
    }else{
        NSLog(@"失败");
    }
    
    
    return YES;
}
@end
