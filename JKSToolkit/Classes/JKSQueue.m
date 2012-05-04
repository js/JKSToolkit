//
//  JKSQueue.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/4/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "JKSQueue.h"

@interface JKSQueue ()
@property (strong) NSMutableArray *queue;
@end

@implementation JKSQueue
@synthesize queue = _queue;

- (instancetype)init
{
    if ((self = [super init])) {
        _queue = [[NSMutableArray alloc] init];
    }
    return self;
}


- (instancetype)initWithContentsOfArray:(NSArray *)array
{
    if ((self = [super init])) {
        _queue = [[NSMutableArray alloc] initWithArray:array];
    }
    return self;
}


- (void)enqueue:(id)object
{
    NSParameterAssert(object);
    [self.queue addObject:object];
}


- (id)dequeue
{
    if ([self count] == 0)
        return nil;

    id obj = [self.queue objectAtIndex:0];
    [self.queue removeObjectAtIndex:0];
    return obj;
}


- (void)removeAllEnquedObjects
{
    [self.queue removeAllObjects];
}


- (NSUInteger)count
{
    return [self.queue count];
}


- (id)peek
{
    if ([self count] == 0)
        return nil;
    return [self.queue objectAtIndex:0];
}


- (BOOL)containsObject:(id)object
{
    return [self.queue containsObject:object];
}

@end
