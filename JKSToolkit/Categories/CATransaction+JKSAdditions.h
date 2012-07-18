//
//  CATransaction+JKSAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 7/18/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CATransaction (JKSAdditions)
+ (void)jks_transactionWithBlock:(dispatch_block_t)block;
+ (void)jks_transactionWithBlock:(dispatch_block_t)block completionBlock:(dispatch_block_t)completionBlock;
+ (void)jks_transactionWithDisabledActionsBlock:(dispatch_block_t)block;
@end
