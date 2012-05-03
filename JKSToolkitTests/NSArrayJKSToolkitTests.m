//
//  NSArrayJKSToolkitTests.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/1/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSArray+JKSToolkit.h"

@interface NSArrayJKSToolkitTests : SenTestCase
@end

@implementation NSArrayJKSToolkitTests

- (void)testFirstObject
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", @"baz", nil];
    STAssertEqualObjects(@"foo", [array jks_firstObject], nil);
    STAssertNil([[NSArray array] jks_firstObject], nil);
}


- (void)testObjectsPassingTest
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", @"baz", nil];
    NSArray *filtered = [array jks_objectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [(NSString *)obj hasPrefix:@"ba"];
    }];
    STAssertEqualObjects(([NSArray arrayWithObjects:@"bar", @"baz", nil]), filtered, nil);
}

@end
