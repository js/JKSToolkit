//
//  NSString+JKSAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JKSAdditions)

/** Returns a globally unique identifier
 */
+ (NSString *)jks_UUID;

@end
