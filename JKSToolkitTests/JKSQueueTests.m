//
//  JKSQueueTests.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/4/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "JKSQueue.h"

@interface JKSQueueTests : SenTestCase

@end


@implementation JKSQueueTests

- (void)testInitWithArrayAndCount
{
    NSArray *array = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
    JKSQueue *queue = [[JKSQueue alloc] initWithContentsOfArray:array];
    STAssertNotNil(queue, nil);
    STAssertEquals((NSUInteger)3, [queue count], nil);

    JKSQueue *queue2 = [[JKSQueue alloc] init];
    STAssertNotNil(queue2, nil);
    STAssertEquals((NSUInteger)0, [queue2 count], nil);
}


- (void)testEnqueingAndDequeing
{
    JKSQueue *queue = [[JKSQueue alloc] init];
    [queue enqueue:@"foo"];
    STAssertEquals((NSUInteger)1, [queue count], nil);

    NSString *s = [queue dequeue];
    STAssertEqualObjects(@"foo", s, nil);
    STAssertEquals((NSUInteger)0, [queue count], nil);

    STAssertNil([queue dequeue], @"An empty queue should return nil");

    [queue enqueue:@"foo"];
    [queue enqueue:@"foo"];
    [queue enqueue:@"baz"];
    STAssertEquals((NSUInteger)3, [queue count], nil);
    STAssertEqualObjects(@"foo", [queue dequeue], nil);
    STAssertEquals((NSUInteger)2, [queue count], nil);
}


- (void)testPeek
{
    JKSQueue *queue = [[JKSQueue alloc] initWithContentsOfArray:[NSArray arrayWithObjects:@"one", @"two", @"three", nil]];
    id peeked = [queue peek];
    STAssertEqualObjects(@"one", peeked, nil);
    STAssertEquals((NSUInteger)3, [queue count], nil);
}


- (void)testContainsObject
{
    JKSQueue *queue = [[JKSQueue alloc] initWithContentsOfArray:[NSArray arrayWithObjects:@"one", @"two", @"three", nil]];
    STAssertTrue([queue containsObject:@"two"], nil);
    STAssertFalse([queue containsObject:@"foo"], nil);
}


- (void)testRemoveAllEnquedObjects
{
    JKSQueue *queue = [[JKSQueue alloc] initWithContentsOfArray:[NSArray arrayWithObjects:@"one", @"two", @"three", nil]];
    [queue removeAllEnquedObjects];
    STAssertEquals((NSUInteger)0, [queue count], nil);
}

@end
