//
//  NSString+JKSAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+JKSAdditions.h"

@implementation NSString (JKSAdditions)

+ (NSString *)jks_UUIDString
{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    return uuidStr;
}


- (NSString *)jks_stringByTrimmingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)jks_stringByTrimmingWhitespaceAndNewlines
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


#pragma mark - Digests


static NSString* MakeDigestString(NSString *source,
                                  unsigned char *(*digest_func)(const void *, CC_LONG, unsigned char *),
                                  CC_LONG digestLength)
{
    unsigned char result[digestLength];
    memset(result, 0, sizeof(result));
    const char *str = [source UTF8String];
    digest_func(str, strlen(str), result);

    NSMutableString *hexedHashString = [[NSMutableString alloc] initWithCapacity:digestLength];
    for (NSUInteger i = 0; i < sizeof(result); i++) {
        [hexedHashString appendFormat:@"%02X", result[i]];
    }

    return [hexedHashString lowercaseString];
}


- (NSString *)jks_MD5Hash
{
    return MakeDigestString(self, CC_MD5, CC_MD5_DIGEST_LENGTH);
}


- (NSString *)jks_SHA1Hash
{
    return MakeDigestString(self, CC_SHA1, CC_SHA1_DIGEST_LENGTH);
}


- (NSString *)jks_SHA256Hash
{
    return MakeDigestString(self, CC_SHA256, CC_SHA256_DIGEST_LENGTH);
}

@end
