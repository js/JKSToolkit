//
//  NSDictionary+JKSAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JKSAdditions)

/** Returns the value associated with the given key, or nil if the value doesn't exist or is NSNull
 *
 * @paramm key The key for which to return the corresponding value
 * @returns The value associated with key or nil if no value is associated with the key or if the value is NSNull
 */
- (id)jks_objectOrNilForKey:(id)key;
@end
