//
//  GCDSemaphoresVC.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/8/9.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "GCDSemaphoresVC.h"

@interface GCDSemaphoresVC ()

@end

@implementation GCDSemaphoresVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 100; i++)
    {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(2);
            dispatch_semaphore_signal(semaphore);
        });
    }
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
