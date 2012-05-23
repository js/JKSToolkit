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


- (void)testObjectPassingTest
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", @"baz", nil];
    id found = [array jks_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return NO;
    }];
    STAssertNil(found, nil);

    found = [array jks_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isEqual:@"bar"];
    }];
    STAssertEqualObjects(@"bar", found, nil);
}


- (void)testSelectEvery
{
    NSArray *letters = [@"a b c d e f g h i j k" componentsSeparatedByString:@" "];
    NSArray *everyThird = [letters jks_selectEvery:3];
    NSArray *expected = [NSArray arrayWithObjects:@"a", @"d", @"g", @"j", nil];
    STAssertEquals([expected count], [everyThird count], nil);
    STAssertEqualObjects(expected, everyThird, nil);
}

@end
