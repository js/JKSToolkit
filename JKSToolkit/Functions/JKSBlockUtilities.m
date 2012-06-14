//
//  JKSBlockUtilities.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 6/14/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "JKSBlockUtilities.h"

dispatch_block_t JKSBlockWithAutoreleasePool(dispatch_block_t block)
{
    return [^{
        @autoreleasepool {
            block();
        }
    } copy];
}