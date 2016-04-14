//
//  NSOperationVC.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/4/14.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "NSOperationVC.h"
#import "SubOperation.h"

@interface NSOperationVC ()
@property (nonatomic, strong) SubOperation *operation;
@end

@implementation NSOperationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.operation = [SubOperation blockOperationWithBlock:^{
        [weakSelf subOperationThread];
    }];
    self.operation.completionBlock = ^{
        [weakSelf subOperationThread];
    };
    [self.operation start];
    
    
    // Do any additional setup after loading the view.
}

- (void)subOperationThread {
    NSLog(@"ismain:%@", [NSThread isMainThread] ? @"yes" : @"no");
    NSLog(@"thread:%@", [NSThread currentThread]);
    NSLog(@"_cmd:%@;;clas:%@", NSStringFromSelector(_cmd), NSStringFromClass([self class]));
}

@end
