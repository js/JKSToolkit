//
//  JKSGeometryTests.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 6/27/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "JKSGeometry.h"

@interface JKSGeometryTests : SenTestCase

@end


@implementation JKSGeometryTests

- (void)testCGRectMakeWithCenter
{
    CGPoint center = CGPointMake(100, 200);
    CGSize size = CGSizeMake(50, 50);
    CGRect rect = JKSCGRectMakeWithCenter(center, size);
    STAssertEquals(rect.origin.x, (CGFloat)75.0, nil);
    STAssertEquals(rect.origin.y, (CGFloat)175.0, nil);
    STAssertEquals(rect.size, size, nil);
}


- (void)testJKSCGRectMakeWithAnchorPoints
{
    CGPoint top = CGPointMake(100, 100);
    CGPoint bottom = CGPointMake(250, 250);
    CGRect rect = JKSCGRectMakeWithAnchorPoints(top, bottom);
    STAssertEquals(rect.origin, top, nil);
    STAssertEquals(rect.size, CGSizeMake(150, 150), nil);
}

@end
