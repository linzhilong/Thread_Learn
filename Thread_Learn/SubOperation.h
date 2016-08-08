//
//  SubOperation.h
//  Thread_Learn
//
//  Created by 林志龙 on 16/7/26.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubOperation : NSOperation
- (instancetype)initWithIndex:(NSString *)indexStr;
@property (nonatomic, copy) NSString *indexStr;
@end
