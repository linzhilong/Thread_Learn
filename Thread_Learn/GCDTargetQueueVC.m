//
//  GCDTargetQueueVC.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/8/8.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "GCDTargetQueueVC.h"

@interface GCDTargetQueueVC ()

@end

@implementation GCDTargetQueueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @autoreleasepool {
        NSArray *house1Folks = @[@"Joe", @"Jack", @"Jill"];
        NSArray *house2Folks = @[@"Irma", @"Irene", @"Ian"];
        
        dispatch_queue_t house1Queue = dispatch_queue_create("house 1", DISPATCH_QUEUE_CONCURRENT);
        dispatch_queue_t house2Queue = dispatch_queue_create("house 2", DISPATCH_QUEUE_CONCURRENT);
        
        // Set the target queue for BOTH house queues
        dispatch_queue_t partyLine = dispatch_queue_create("party line", DISPATCH_QUEUE_SERIAL);
        dispatch_set_target_queue(house1Queue, partyLine);
        dispatch_set_target_queue(house2Queue, partyLine);
        
        for (NSString *caller in house1Folks) {
            dispatch_async(house1Queue, ^{
                makeCall(house1Queue, caller, house2Folks);
            });
        }
        for (NSString *caller in house2Folks) {
            dispatch_async(house2Queue, ^{
                makeCall(house2Queue, caller, house1Folks);
            });
        }
    }
//    dispatch_main();
    // Do any additional setup after loading the view.
}

void makeCall(dispatch_queue_t queue, NSString *caller, NSArray *callees) {
    // Randomly call someone
    NSInteger targetIndex = arc4random() % callees.count;
    NSString *callee = callees[targetIndex];
    
    NSLog(@"%@ is calling %@...", caller, callee);
    sleep(1);
    NSLog(@"...%@ is done calling %@.", caller, callee);
    
    // Wait some random time and call again
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (arc4random() % 1000) * NSEC_PER_MSEC), queue, ^{
        makeCall(queue, caller, callees);
    });
}

@end
