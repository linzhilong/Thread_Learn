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
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue setMaxConcurrentOperationCount:1];
    SubOperation *operation0 = [[SubOperation alloc] initWithIndex:@"0"];
    __weak typeof(SubOperation *) weakOperation0 = operation0;
    [operation0 setCompletionBlock:^(void) {
        NSLog(@"complete.index:%@", weakOperation0.indexStr);
    }];
//    SubOperation *operation1 = [[SubOperation alloc] initWithIndex:@"1"];
//    __weak typeof(SubOperation *) weakOperation1 = operation1;
//    [operation1 setCompletionBlock:^(void) {
//        NSLog(@"complete.index:%@", weakOperation1.indexStr);
//    }];
//    SubOperation *operation2 = [[SubOperation alloc] initWithIndex:@"2"];
//    __weak typeof(SubOperation *) weakOperation2 = operation2;
//    [operation2 setCompletionBlock:^(void) {
//        NSLog(@"complete.index:%@", weakOperation2.indexStr);
//    }];
//    SubOperation *operation3 = [[SubOperation alloc] initWithIndex:@"3"];
//    __weak typeof(SubOperation *) weakOperation3 = operation3;
//    [operation3 setCompletionBlock:^(void) {
//        NSLog(@"complete.index:%@", weakOperation3.indexStr);
//    }];
//    SubOperation *operation4 = [[SubOperation alloc] initWithIndex:@"4"];
//    __weak typeof(SubOperation *) weakOperation4 = operation4;
//    [operation4 setCompletionBlock:^(void) {
//        NSLog(@"complete.index:%@", weakOperation4.indexStr);
//    }];
//    SubOperation *operation5 = [[SubOperation alloc] initWithIndex:@"5"];
//    __weak typeof(SubOperation *) weakOperation5 = operation5;
//    [operation5 setCompletionBlock:^(void) {
//        NSLog(@"complete.index:%@", weakOperation5.indexStr);
//    }];
//    [operation0 addDependency:operation5];
////    [operation1 addDependency:operation2];
////    [operation2 addDependency:operation3];
////    [operation3 addDependency:operation4];
////    [operation4 addDependency:operation5];
//    [queue addOperation:operation0];
//    [queue addOperation:operation1];
//    [queue addOperation:operation2];
//    [queue addOperation:operation3];
//    [queue addOperation:operation4];
//    [queue addOperation:operation5];
//    
//    [operation5 performSelector:@selector(cancel) withObject:0 afterDelay:0.5];
    [operation0 start];
    [operation0 waitUntilFinished];
//    [operation0 cancel];
    NSLog(@"viewdidload_end");
}

@end
