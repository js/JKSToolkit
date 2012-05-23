//
//  NSArray+JKSToolkit.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/1/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "NSArray+JKSToolkit.h"

@implementation NSArray (JKSToolkit)

- (id)jks_firstObject
{
    if (![self count])
        return nil;

    return [self objectAtIndex:0];
}


- (NSArray *)jks_objectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate
{
    NSIndexSet *indexes = [self indexesOfObjectsPassingTest:predicate];
    return [self objectsAtIndexes:indexes];
}


- (id)jks_objectPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate
{
    NSIndexSet *indexes = [self indexesOfObjectsPassingTest:predicate];
    if ([indexes count]) {
        return [self objectAtIndex:[indexes firstIndex]];
    }
    return nil;
}


- (NSArray *)jks_selectEvery:(NSUInteger)nth
{
    NSMutableArray *selected = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < [self count]; i += nth) {
        [selected addObject:[self objectAtIndex:i]];
    }
    return [NSArray arrayWithArray:selected];
}

@end
