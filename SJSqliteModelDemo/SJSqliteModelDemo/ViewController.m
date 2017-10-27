//
//  ViewController.m
//  SJSqliteModelDemo
//
//  Created by ShaJin on 2017/10/27.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#import "ViewController.h"
#import "SJSqliteModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[SJSqliteModel shareInstance] creatDataBase];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
