//
//  GCDObjectsVC.m
//  Thread_Learn
//
//  Created by zhilong.lin on 16/8/9.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "GCDObjectsVC.h"

@interface GCDObjectsVC ()

@end

@implementation GCDObjectsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_group_t group = dispatch_group_create();
    NSString *str = @"abc";
    dispatch_set_context(group, (__bridge void *)(str));
    void *context = dispatch_get_context(group);
    NSString *str1 = (__bridge NSString *)(context);
    NSLog(@"str1:%@", str1);
    
    context = (__bridge void *)(str);
    
    dispatch_set_finalizer_f(group, finalizer);
    
    sleep(1);
    group = nil; //dispatchObject被释放，这时调用finalizer函数
}

void finalizer(void *context) {
    NSString *contextStr = (__bridge NSString *)(context);
    NSLog(@"contextStr:%@", contextStr);

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
