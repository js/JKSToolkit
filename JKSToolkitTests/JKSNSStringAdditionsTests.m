//
//  JKSNSStringAdditionsTests.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSString+JKSAdditions.h"

@interface JKSNSStringAdditionsTests : SenTestCase

@end


@implementation JKSNSStringAdditionsTests

- (void)testUUID
{
    NSString *uuid = [NSString jks_UUIDString];
    STAssertEquals((NSUInteger)36, [uuid length], nil);
}

@end
