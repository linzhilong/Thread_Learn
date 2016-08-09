//
//  MainTableViewController.m
//  PractiseProject
//
//  Created by zhilong.lin on 15/10/22.
//  Copyright © 2015年 zhilong.lin. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()
@property (nonatomic, strong) NSMutableArray *mainArrays;
@end

@implementation MainTableViewController
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSWillBecomeMultiThreadedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSDidBecomeSingleThreadedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSThreadWillExitNotification object:nil];
}

- (void)addNotification {
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(becomeMultiThreadNotification:)
//                                                     name:NSWillBecomeMultiThreadedNotification
//                                                   object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(becomeSingleThreadNotification:)
//                                                     name:NSDidBecomeSingleThreadedNotification
//                                                   object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(WillExitNotification:)
//                                                     name:NSThreadWillExitNotification
//                                                   object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotification];
    
    self.mainArrays = [NSMutableArray array];
    [self.mainArrays addObject:@"NSThreadViewController"];
    [self.mainArrays addObject:@"NSBlockOperationVC"];
    [self.mainArrays addObject:@"NSOperationVC"];
    [self.mainArrays addObject:@"GCDVC"];
    [self.mainArrays addObject:@"GCDTargetQueueVC"];
    [self.mainArrays addObject:@"GCDGroupVC"];
    [self.mainArrays addObject:@"GCDObjectsVC"];
    [self.mainArrays addObject:@"GCDSemaphoresVC"];
    [self.mainArrays addObject:@"GCDBarriersVC"];
    
//    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^(){
//        NSLog(@"执行第1次操作，线程：%@", [NSThread currentThread]);
//    }];
//    
//    [operation addExecutionBlock:^() {
//        NSLog(@"又执行了1个新的操作，线程：%@", [NSThread currentThread]);
//    }];
//    
//    [operation addExecutionBlock:^() {
//        NSLog(@"又执行了1个新的操作，线程：%@", [NSThread currentThread]);
//    }];
//    
//    [operation addExecutionBlock:^() {
//        NSLog(@"又执行了1个新的操作，线程：%@", [NSThread currentThread]);
//    }];  
//    
//    // 开始执行任务  
//    [operation start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mainArrays.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdx = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdx];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdx];
    }
    
    cell.textLabel.text = self.mainArrays[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id vc = [[NSClassFromString(self.mainArrays[indexPath.row]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"AddPlayer"]) {
        UINavigationController *navigationController = segue.destinationViewController;
//        PlayerDetailsViewController *playerDetailsViewController = [navigationController viewControllers][0];
//        playerDetailsViewController.delegate = self;
    }
}

- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender
{
    UIViewController *sourceViewController = sender.sourceViewController;
    // Pull any data from the view controller which initiated the unwind segue.
}

#pragma mark - notifications
- (void)becomeMultiThreadNotification:(NSNotification *)notification {
    NSLog(@"_cmd:%@;;notification:%@", NSStringFromSelector(_cmd), notification);
}

- (void)becomeSingleThreadNotification:(NSNotification *)notification {
    NSLog(@"_cmd:%@;;notification:%@", NSStringFromSelector(_cmd), notification);
}

- (void)WillExitNotification:(NSNotification *)notification {
    NSLog(@"_cmd:%@;;notification:%@", NSStringFromSelector(_cmd), notification);
}

@end
