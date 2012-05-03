//
//  NSError+JKSAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "NSError+JKSAdditions.h"

@implementation NSError (JKSAdditions)

+ (NSError *)jks_errorWithDomain:(NSString *)domain
                            code:(NSInteger)code
                     description:(NSString *)description
                          reason:(NSString *)failureReason
                        userInfo:(NSDictionary *)dict
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    if (description)
        [userInfo setObject:description forKey:NSLocalizedDescriptionKey];
    if (failureReason)
        [userInfo setObject:failureReason forKey:NSLocalizedFailureReasonErrorKey];

    if (dict)
        [userInfo addEntriesFromDictionary:dict];

    return [NSError errorWithDomain:domain code:code userInfo:userInfo];
}

@end
