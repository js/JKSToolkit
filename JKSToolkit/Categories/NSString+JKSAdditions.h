//
//  NSString+JKSAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JKSAdditions)

/** Returns a globally unique identifier */
+ (NSString *)jks_UUIDString;

/** Returns a new string which is trimmed from whitespace */
- (NSString *)jks_stringByTrimmingWhitespace;

/** Returns a new string which is trimmed from whitespace and newlines */
- (NSString *)jks_stringByTrimmingWhitespaceAndNewlines;

/** Returns an MD5 hash of the receiver */
- (NSString *)jks_MD5Hash;

/** Returns a SHA1 hash of the receiver */
- (NSString *)jks_SHA1Hash;

/** Returns a SHA256 hash of the receiver */
- (NSString *)jks_SHA256Hash;

@end
