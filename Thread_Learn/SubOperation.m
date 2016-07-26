//
//  SubOperation.m
//  Thread_Learn
//
//  Created by 林志龙 on 16/7/26.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "SubOperation.h"

@implementation SubOperation

- (void)main {
    [super main];
    [self subOperationThread];
}

- (void)subOperationThread {
    NSLog(@"ismain:%@", [NSThread isMainThread] ? @"yes" : @"no");
    NSLog(@"thread:%@", [NSThread currentThread]);
    NSLog(@"_cmd:%@;;clas:%@", NSStringFromSelector(_cmd), NSStringFromClass([self class]));
}

@end
