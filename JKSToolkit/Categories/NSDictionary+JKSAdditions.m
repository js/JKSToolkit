//
//  NSDictionary+JKSAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "NSDictionary+JKSAdditions.h"

@implementation NSDictionary (JKSAdditions)

- (id)jks_objectOrNilForKey:(id)key
{
    id value = [self objectForKey:key];
    if (value == [NSNull null]) {
        return nil;
    }
    
    return value;
}

@end
