//
//  main.m
//  SJSqliteModelDesktopDemo
//
//  Created by ShaJin on 2017/10/27.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJSqliteModel.h"
#import "TestModel.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[SJSqliteModel shareInstance] creatDataBase];
        NSArray *array = [TestModel findAll];
        NSLog(@"array = %@",array);
    }
    return 0;
}
