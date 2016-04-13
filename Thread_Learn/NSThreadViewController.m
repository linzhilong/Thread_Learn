//
//  NSThreadViewController.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/4/13.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSThread detachNewThreadSelector:@selector(myThreadMainMethod:) toTarget:self withObject:@"test"];
}

- (void)myThreadMainMethod:(id)object {
    NSLog(@"thread:%@", [NSThread currentThread]);
    NSLog(@"object:%@", (NSString *)object);
    [NSThread  exit];
    NSLog(@"thread:%@", [NSThread currentThread]);
}

@end
