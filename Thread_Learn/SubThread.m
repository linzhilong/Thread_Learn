//
//  SubThread.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/4/14.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "SubThread.h"

@implementation SubThread

- (void)main {
//    [super main];
    
    self.name = @"thread-1";
    [self setQualityOfService:NSQualityOfServiceUtility];
    [self.threadDictionary setObject:@"haha" forKey:@"haha"];
    
    [self myThreadMainMethod:nil];
}

- (void)myThreadMainMethod:(id)object {
    NSLog(@"ismain:%@", [NSThread isMainThread] ? @"yes" : @"no");
    NSLog(@"thread:%@", [NSThread currentThread]);
    NSLog(@"_cmd:%@;;clas:%@", NSStringFromSelector(_cmd), NSStringFromClass([self class]));
}

@end
