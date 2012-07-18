//
//  CATransaction+JKSAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 7/18/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "CATransaction+JKSAdditions.h"

@implementation CATransaction (JKSAdditions)

+ (void)jks_transactionWithBlock:(dispatch_block_t)block
{
    [CATransaction begin];
    block();
    [CATransaction commit];
}


+ (void)jks_transactionWithBlock:(dispatch_block_t)block completionBlock:(dispatch_block_t)completionBlock
{
    [CATransaction begin];
    [CATransaction setCompletionBlock:completionBlock];
    block();
    [CATransaction commit];
}


+ (void)jks_transactionWithDisabledActionsBlock:(dispatch_block_t)block
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    block();
    [CATransaction commit];
}

@end
