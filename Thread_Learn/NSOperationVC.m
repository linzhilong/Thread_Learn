//
//  NSOperationVC.m
//  Thread_Learn
//
//  Created by 林志龙 on 16/7/26.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "NSOperationVC.h"
#import "SubOperation.h"

@implementation NSOperationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    SubOperation *operation = [[SubOperation alloc] init];
    [operation start];
}

@end
