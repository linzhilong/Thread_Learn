//
//  NSThreadViewController.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/4/13.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "NSThreadViewController.h"
#import "SubThread.h"

@interface NSThreadViewController ()
@property (nonatomic, strong) SubThread *thread;
@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[SubThread alloc] initWithTarget:self selector:@selector(myThreadMainMethod:) object:@"test"];
    
    [self.thread start];
    
//    [self.thread cancel];
//    [NSThread detachNewThreadSelector:@selector(myThreadMainMethod:) toTarget:self withObject:@"test"];
    
//    [self performSelector:@selector(check) withObject:self afterDelay:0.f];
//    [self performSelector:@selector(check) withObject:self afterDelay:2.f];
//    [self performSelector:@selector(check) withObject:self afterDelay:3.f];
//    [self performSelector:@selector(check) withObject:self afterDelay:4.f];
}

- (void)check {
    [self cancel];
    [self executing];
    [self finished];
}

- (void)cancel {
//    [self.thread cancel];
    NSLog(@"_cmd:%@;;iscancel:%@", NSStringFromSelector(_cmd), self.thread.isCancelled ? @"yes" : @"no");
}

- (void)executing {
    NSLog(@"_cmd:%@;;isexecuting:%@", NSStringFromSelector(_cmd), self.thread.isExecuting ? @"yes" : @"no");
}

- (void)finished {
    NSLog(@"_cmd:%@;;isfinished:%@", NSStringFromSelector(_cmd), self.thread.isFinished ? @"yes" : @"no");
}

- (void)myThreadMainMethod:(id)object {
    [self.thread cancel];
    
//    NSInteger count = 0;
//    for (NSInteger index = 0; index < 1000000000; index ++) {
//        count ++;
//    }
    NSLog(@"ismain:%@", [NSThread isMainThread] ? @"yes" : @"no");
    NSLog(@"ismultithread:%@", [NSThread isMultiThreaded] ? @"yes" : @"no");
    [NSThread sleepForTimeInterval:2.f];
    
    NSLog(@"qualityofservice:%d", [[NSThread currentThread] qualityOfService]);
    
    
//    [NSThread exit];
//    [NSThread sleepForTimeInterval:1.f];
    
    NSLog(@"callStackReturnAddresses:%@", [NSThread callStackReturnAddresses]);
    NSLog(@"callStackSymbols:%@", [NSThread callStackSymbols]);
    
    
    NSLog(@"name:%@", [NSThread currentThread].name);
    
    NSLog(@"stacksize:%ld", (long)[NSThread currentThread].stackSize);
    [NSThread currentThread].stackSize = 1024 * 4 * 10;
    NSLog(@"2-stacksize:%ld", (long)[NSThread currentThread].stackSize);
    
    NSLog(@"main_thread:%@", [NSThread mainThread]);
    
    NSLog(@"thread:%@", [NSThread currentThread]);
    NSLog(@"object:%@", (NSString *)object);
    NSLog(@"thread:%@", [NSThread currentThread]);
    
    NSLog(@"threadDict:%@", [NSThread currentThread].threadDictionary);
}

@end
