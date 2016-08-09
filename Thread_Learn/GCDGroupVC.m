//
//  GCDGroupVC.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/8/9.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "GCDGroupVC.h"

@interface GCDGroupVC ()

@end

@implementation GCDGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.lzl.test.gcdgroup", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("com.lzl.test.gcdgroup2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_async(group, queue, ^(void){
        NSLog(@"sleep_before");
        sleep(1);
        NSLog(@"sleep_after");
    });
    dispatch_group_async(group, queue2, ^(void){
        NSLog(@"sleep_before2");
        sleep(2);
        NSLog(@"sleep_after2");
    });

//    dispatch_group_enter(group);
////    dispatch_async(queue, ^(void){
////        sleep(1);
////        dispatch_group_leave(group);
////    });
//    dispatch_async(queue2, ^(void){
//        sleep(5);
//        dispatch_group_leave(group);
//    });
    
    NSLog(@"dispatch_group_wait_before");
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"dispatch_group_wait_after");
    
    dispatch_group_notify(group, queue, ^(void){
        NSLog(@"notifyqueue");
    });
    dispatch_group_notify(group, queue2, ^(void){
        NSLog(@"notifyqueue2");
    });

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
