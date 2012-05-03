//
//  JKSNSDictionaryAdditionsTests.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSDictionary+JKSAdditions.h"

@interface JKSNSDictionaryAdditionsTests : SenTestCase

@end


@implementation JKSNSDictionaryAdditionsTests

- (void)testObjectOrNilForKey
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"quux", @"foo",
                          [NSNull null], @"bar",
                          nil];
    STAssertNil([dict jks_objectOrNilForKey:@"bar"], nil);
    STAssertEqualObjects(@"quux", [dict jks_objectOrNilForKey:@"foo"], nil);
    STAssertNil([dict jks_objectOrNilForKey:@"nosuchkey"], nil);
}

@end
