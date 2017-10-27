//
//  NSObject+Model.m
//  SJSqliteModel
//
//  Created by ShaJin on 2017/10/27.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#import "NSObject+Model.h"
#import <sqlite3.h>
@implementation NSObject (Model)
-(void)insertIntoDataBasePath:(NSString *)path tableName:(NSString *)tableName succeed:(void(^)())succeed failure:(void(^)(NSString *error))failure{
    // 不存在--  创建表  -- 保存
    // 存在 不是 这个表 ----更新表 -- 保存
    // 存在 是--- 保存
    
//    if ([self respondsToSelector:@selector(desomething)]) {
//        [self performSelector:@selector(dosomething)];
//    }
    
}
+(NSArray *)findAll{
    NSString *desktop = @"/Users/apple/Desktop";
    NSString *fileName = @"db";
    NSString *path = [NSString stringWithFormat:@"%@/%@",desktop,fileName];
    sqlite3 *db;
    sqlite3_stmt * stmt;
    int result = sqlite3_open(path.UTF8String, &db);
    if (result == SQLITE_OK) {
        NSLog(@"成功");
        result = sqlite3_prepare_v2(db, "select * from Test", -1, &stmt, NULL);
        if (result == SQLITE_OK) {
//            NSMutableArray * peoples = [NSMutableArray array];
            while (sqlite3_step(stmt) == SQLITE_ROW) {
//                //            sqlite3_step 用来判断是否有下一行
//                int stuid = sqlite3_column_int(stmt, 0); //取一行中的一个,int为值的类型
//                const unsigned charchar * stuname = sqlite3_column_text(stmt, 1); //取一行中的一个,text为值的类型 char *是字符串
//                const unsigned charchar * stusex = sqlite3_column_text(stmt, 2); //取一行中的一个,text为值的类型
//                float stuscore = sqlite3_column_double(stmt, 3); //取一行中的一个,double为值的类型
//                NSString * currentName = [NSString stringWithUTF8String:(const charchar *)stuname];
//                NSString * currentSex = [NSString stringWithUTF8String:(const charchar *)stusex];
//                
//                StudentModel * currentModel = [StudentModel studentModelWithId:stuid name:currentName sex:currentSex score:stuscore];  //便利构造器 添加数据到Model
//                [peoples addObject:currentModel];
//                NSString *name = sqlite3_column_int(stmt, 0);
                const unsigned char *name = sqlite3_column_text(stmt, 0);
                NSLog(@"name = %s",name);
            }
        }
        
        
        
        
        
    }else{
        NSLog(@"失败");
    }

    
    return nil;
}
@end
