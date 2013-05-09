//
//  JKSNSStringAdditionsTests.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSString+JKSAdditions.h"
#import "NSString+JKSBase64.h"

@interface JKSNSStringAdditionsTests : SenTestCase

@end


@implementation JKSNSStringAdditionsTests

- (void)testUUID
{
    NSString *uuid = [NSString jks_UUIDString];
    STAssertEquals((NSUInteger)36, [uuid length], nil);
}


- (void)testStringByTrimmingWhitespace
{
    NSString *trimmed = [@"   foo bar\n  " jks_stringByTrimmingWhitespace];
    STAssertEqualObjects(@"foo bar\n", trimmed, nil);
}


- (void)testStringByTrimmingWhitespaceAndNewlines
{
    NSString *trimmed = [@"   foo bar\n  " jks_stringByTrimmingWhitespaceAndNewlines];
    STAssertEqualObjects(@"foo bar", trimmed, nil);
}


- (void)testMD5Hash
{
    STAssertEqualObjects(@"5185e8b8fd8a71fc80545e144f91faf2", [@"fubar" jks_MD5Hash], nil);
}


- (void)testSHA1Hash
{
    STAssertEqualObjects(@"9ab50f27d4201db9b28483ba83c48ebafbb2aa17", [@"fubar" jks_SHA1Hash], nil);
}


- (void)testSHA256Hash
{
    STAssertEqualObjects(@"cc7b318a05d752cb1183d89545bc39017fdd811565520073fd17e323b738c283", [@"fubar" jks_SHA256Hash], nil);
}


- (void)testBase64Encode
{
    STAssertEqualObjects(@"SGVsbG8gV29ybGQh", [@"Hello World!" jks_base64EncodedString], nil);
}


- (void)testBase64Decode
{
    STAssertEqualObjects(@"Hello World!", [@"SGVsbG8gV29ybGQh" jks_base64DecodedString], nil);
}

@end
