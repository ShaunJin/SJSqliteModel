//
//  NSObject+Model.m
//  SJSqliteModel
//
//  Created by ShaJin on 2017/10/27.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#import "NSObject+Model.h"
#import <sqlite3.h>
#import <objc/runtime.h>
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
            int count = sqlite3_column_count(stmt);
            NSLog(@"count = %d",count);
            
            
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
                
                
                for (int i = 0; i < count; i++) {
                    // 1.取出当前字段的名称(key)
                    NSString *key = [NSString stringWithUTF8String:sqlite3_column_name(stmt, i)];
                    
//                    // 2.取出当前字段对应的值(value)
//                                    const char *cValue = (const char *)sqlite3_column_text(stmt, i);
//                                    NSString *value = [NSString stringWithUTF8String:cValue];
                    NSLog(@"key = %@",key);
//                    1：SQLITE_INTEGER
//                    2：SQLITE_FLOAT
//                    3：SQLITE_TEXT
//                    4：SQLITE_BLOB  
//                    5：SQLITE_NULL
//                    NSString *value = [NSString stringWithUTF8String:sqlite3_column_type(<#sqlite3_stmt *#>, <#int iCol#>)]
                    // 3.将键值对放入字典中
                    //                [dict setObject:value forKey:key];
//                    self object = [self new];
//                    NSLog(@"className = %@",)
//                    id object = [self new];
//                    unsigned int count = 0;
                    //获取属性的列表
//                    objc_property_t *propertyList =  class_copyPropertyList([self class], &count);
//                    NSMutableArray *propertyArray = [NSMutableArray array];
                    
//                    for(int i=0;i<count;i++)
//                    {
//                        //取出每一个属性
//                        objc_property_t property = propertyList[i];
//                        //获取每一个属性的变量名
//                        const char* propertyName = property_getName(property);
//                        
////                        NSString *proName = [[NSString alloc] initWithCString:propertyName encoding:NSUTF8StringEncoding];
//                        NSString *proName = [NSString stringWithUTF8String:propertyName];
//                        [propertyArray addObject:proName];
//                        NSLog(@"proName = %@",proName);
//                    }  
                    //c语言的函数，所以要去手动的去释放内存
//                    free(propertyList);  

                    
                    const unsigned char *name = sqlite3_column_text(stmt, 0);
                    NSLog(@"name = %s",name);
                }
                
                
            }
        }
        
        
        
        
        
    }else{
        NSLog(@"失败");
    }
    return nil;
}
@end
