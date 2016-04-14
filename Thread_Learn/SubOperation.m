//
//  SubOperation.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/4/14.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "SubOperation.h"

@implementation SubOperation

- (void)main {
    [super main];
    __weak typeof(self) weakSelf = self;
    self.completionBlock = ^{
        [weakSelf subOperationThread];
    };
//    [self subOperationThread];
}

- (void)subOperationThread {
    NSLog(@"ismain:%@", [NSThread isMainThread] ? @"yes" : @"no");
    NSLog(@"thread:%@", [NSThread currentThread]);
    NSLog(@"_cmd:%@;;clas:%@", NSStringFromSelector(_cmd), NSStringFromClass([self class]));
}

@end
