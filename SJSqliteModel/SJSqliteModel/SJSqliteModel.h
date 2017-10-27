//
//  SJSqliteModel.h
//  SJSqliteModelDemo
//
//  Created by ShaJin on 2017/10/27.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Model.h"
@interface SJSqliteModel : NSObject

/** 路径 */
@property(nonatomic,strong)NSString *path;
+(instancetype)shareInstance;
-(BOOL)creatDataBase;
@end
