//
//  JKSPathUtilities.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/1/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "JKSPathUtilities.h"
#import "NSArray+JKSToolkit.h"
#import "NSString+JKSAdditions.h"

@implementation JKSPathUtilities

NSString* bundleIdentifier()
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}


+ (NSString *)applicationSupportDirectoryPath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) jks_firstObject];
    //return [path stringByAppendingPathComponent:bundleID];
    return [NSString stringWithFormat:@"%@/%@", path, bundleIdentifier()];
}


+ (NSString *)documentsDirectoryPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) jks_firstObject];
}


+ (NSString *)applicationCachePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) jks_firstObject];
    return [NSString stringWithFormat:@"%@/%@", path, bundleIdentifier()];
}


+ (NSString *)uniqueTemporaryFilename
{
    NSString *uuid = [NSString jks_UUID];
    return [NSString stringWithFormat:@"%@/%@.%@", NSTemporaryDirectory(), bundleIdentifier(), uuid];
}

@end
