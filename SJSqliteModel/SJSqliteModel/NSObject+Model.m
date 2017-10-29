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
//NSDictionary *getKeyValue
//                    1：SQLITE_INTEGER
//                    2：SQLITE_FLOAT
//                    3：SQLITE_TEXT
//                    4：SQLITE_BLOB
//                    5：SQLITE_NULL
NSDictionary * getKetValue(sqlite3_stmt *stmt,int index){
    NSDictionary *dic = nil;
    int type = sqlite3_column_type(stmt, index);
    // 取出键名
    NSString *key = [NSString stringWithUTF8String:sqlite3_column_name(stmt, index)];
    switch (type) {
        case SQLITE_INTEGER:{
            dic = @{@"key":key,@"value":[NSNumber numberWithInt:sqlite3_column_int(stmt, index)]};
        }break;
        case SQLITE_FLOAT:{
            dic = @{@"key":key,@"value":[NSNumber numberWithFloat:sqlite3_column_double(stmt, index)]};
        }break;
        case SQLITE_TEXT:{
            dic = @{@"key":key,@"value":[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, index)]};
        }break;
        case SQLITE_BLOB:{
            dic = @{@"key":key,@"value":(__bridge id)sqlite3_column_blob(stmt, index)};
        }break;
        case SQLITE_NULL:{
            
        }
        default:{
            
        }break;
    }
    
    
    return dic;
}
+(NSArray *)propertys
{
    unsigned int count = 0;
    //获取属性的列表
    objc_property_t *propertyList =  class_copyPropertyList(self, &count);
    NSMutableArray *propertyArray = [NSMutableArray array];
    
    for(int i=0;i<count;i++)
    {
        //取出每一个属性
        objc_property_t property = propertyList[i];
        //获取每一个属性的变量名
        const char* propertyName = property_getName(property);
        
        NSString *proName = [[NSString alloc] initWithCString:propertyName encoding:NSUTF8StringEncoding];
        
        [propertyArray addObject:proName];
    }
    //c语言的函数，所以要去手动的去释放内存
    free(propertyList);
    
    return propertyArray.copy;
    
}
+(NSArray *)findAll{
    NSString *desktop = @"/Users/apple/Desktop";
    NSString *fileName = @"db";
    NSString *path = [NSString stringWithFormat:@"%@/%@",desktop,fileName];
    sqlite3 *db;
    sqlite3_stmt * stmt;
    NSMutableArray *mArray = nil;
    int result = sqlite3_open(path.UTF8String, &db);
    if (result == SQLITE_OK) {
        result = sqlite3_prepare_v2(db, "select * from Test", -1, &stmt, NULL);
        if (result == SQLITE_OK) {
            mArray = [NSMutableArray array];
            NSArray *propertyArray = [self propertys];
            int count = sqlite3_column_count(stmt);
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                for (int i = 0; i < count; i++) {
                    NSDictionary *dic = getKetValue(stmt, i);
                    if (dic) {
                        id object = [self new];
                        if ([propertyArray containsObject:dic[@"key"]]) {
                            [object setValue:dic[@"value"] forKey:dic[@"key"]];
                        }
                        [mArray addObject:object];
                    }
                }
            }
        }
    }else{
        NSLog(@"失败");
    }
    return mArray;
}

@end
