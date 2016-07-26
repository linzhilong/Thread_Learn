//
//  NSBlockOperationVC.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/4/14.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "NSBlockOperationVC.h"
#import "SubBlockOperation.h"

@interface NSBlockOperationVC ()
@property (nonatomic, strong) SubBlockOperation *operation;
@end

@implementation NSBlockOperationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.operation = [SubBlockOperation blockOperationWithBlock:^{
        [weakSelf subOperationThread];
    }];
    self.operation.completionBlock = ^{
        [weakSelf subCompleteThread];
    };
    [self.operation start];
    
    
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^(){
        NSLog(@"执行了一个新的操作，线程：%@", [NSThread currentThread]);
    }];
    // 开始执行任务(这里还是同步执行)
    [operation start];
    // Do any additional setup after loading the view.
}

- (void)subCompleteThread {
    NSLog(@"_cmd:%@;;clas:%@", NSStringFromSelector(_cmd), NSStringFromClass([self class]));
    NSLog(@"ismain:%@", [NSThread isMainThread] ? @"yes" : @"no");
    NSLog(@"thread:%@", [NSThread currentThread]);
}

- (void)subOperationThread {
    
    NSLog(@"_cmd:%@;;clas:%@", NSStringFromSelector(_cmd), NSStringFromClass([self class]));
    NSLog(@"ismain:%@", [NSThread isMainThread] ? @"yes" : @"no");
    NSLog(@"thread:%@", [NSThread currentThread]);
    
    [self performSelector:@selector(testOperation) withObject:nil afterDelay:0.3];
    [self.operation cancel];
}

- (void)testOperation {
    NSLog(@"__cmd:%@;;thread:%@", NSStringFromSelector(_cmd), [NSThread currentThread]);
}

@end
