//
//  NSString+JKSBase64.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/9/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import "NSString+JKSBase64.h"
#import <Security/Security.h>

@implementation NSString (JKSBase64)

- (NSString *)jks_base64EncodedString
{
    const char *string = [self UTF8String];

    CFErrorRef error = NULL;
    CFDataRef data = CFDataCreate(kCFAllocatorDefault, (const unsigned char *)string, strlen(string));
    if (data == NULL) {
        return nil;
    }

    SecTransformRef encoder = SecEncodeTransformCreate(kSecBase64Encoding, &error);
    if (encoder == NULL) {
        CFRelease(data);
        return nil;
    }

    SecTransformSetAttribute(encoder, kSecTransformInputAttributeName, data, &error);
    if (error) {
        CFRelease(encoder);
        CFRelease(data);
        return nil;
    }

    CFDataRef encodedData = SecTransformExecute(encoder, &error);
    if (encodedData == NULL) {
        CFRelease(encoder);
        CFRelease(data);
        return nil;
    }

    NSString *encodedString = [[NSString alloc] initWithData:(__bridge NSData *)encodedData encoding:NSUTF8StringEncoding];

	CFRelease(data);
	CFRelease(encoder);
    CFRelease(encodedData);

    return encodedString;
}


- (NSString *)jks_base64DecodedString
{
    const char *string = [self UTF8String];

    CFErrorRef error = NULL;
    CFDataRef data = CFDataCreate(kCFAllocatorDefault, (const unsigned char *)string, strlen(string));
    if (data == NULL) {
        return nil;
    }

    SecTransformRef decoder = SecDecodeTransformCreate(kSecBase64Encoding, &error);
    if (decoder == NULL) {
        CFRelease(data);
        return nil;
    }

    SecTransformSetAttribute(decoder, kSecTransformInputAttributeName, data, &error);
    if (error) {
        CFRelease(decoder);
        CFRelease(data);
        return nil;
    }

    CFDataRef decodedData = SecTransformExecute(decoder, &error);
    if (decodedData == NULL) {
        CFRelease(decoder);
        CFRelease(data);
        return nil;
    }

    NSString *decodedString = [[NSString alloc] initWithData:(__bridge NSData *)decodedData encoding:NSUTF8StringEncoding];

	CFRelease(data);
	CFRelease(decoder);
    CFRelease(decodedData);

    return decodedString;
}

@end
