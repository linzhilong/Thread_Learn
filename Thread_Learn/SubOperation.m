//
//  SubOperation.m
//  Thread_Learn
//
//  Created by 林志龙 on 16/7/26.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "SubOperation.h"

@interface SubOperation () {
    BOOL        executing;
    BOOL        finished;
}

@property (nonatomic, strong) NSRecursiveLock *lock;
@end

@implementation SubOperation

- (void)dealloc {
    NSLog(@"dea:%@", NSStringFromSelector(_cmd));
}

- (instancetype)initWithIndex:(NSString *)indexStr {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.indexStr = indexStr;
    self.lock = [[NSRecursiveLock alloc] init];
    executing = NO;
    finished = NO;
    
    return self;
}

- (void)main {
    [NSThread detachNewThreadSelector:@selector(subOperationThread) toTarget:self withObject:nil];
//    [self subOperationThread];
}

- (BOOL)isReady {
    static int readyCount = 0;
    BOOL logicReady = readyCount ++ > 1;;
    return [super isReady] ;
}

- (void)start {
    // Always check for cancellation before launching the task.
    if ([self isCancelled])
    {
        // Must move the operation to the finished state if it is canceled.
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    if ([self isReady]) {
        // If the operation is not canceled, begin executing the task.
        [self willChangeValueForKey:@"isExecuting"];
        [self main];
        //    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
        executing = YES;
        [self didChangeValueForKey:@"isExecuting"];
    }
}

- (void)completeOperation {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    executing = NO;
    finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (void)subOperationThread {
//    [self.lock lock];
    sleep(2);
    NSLog(@"indexstr:%@", self.indexStr);
    NSLog(@"ismain:%@;;%@", [NSThread isMainThread] ? @"yes" : @"no", self.indexStr);
    NSLog(@"thread:%@;;%@", [NSThread currentThread], self.indexStr);
    NSLog(@"_cmd:%@;;clas:%@;;%@", NSStringFromSelector(_cmd), NSStringFromClass([self class]), self.indexStr);
//    [self.lock unlock];
    
    [self completeOperation];
}

- (BOOL)isConcurrent {
    return NO;
}

- (BOOL)isAsynchronous {
    return NO;
}

- (BOOL)isExecuting {
    return executing;
}

- (BOOL)isFinished {
    return finished;
}

@end
