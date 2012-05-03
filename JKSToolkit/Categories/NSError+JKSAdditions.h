//
//  NSError+JKSAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/3/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (JKSAdditions)

+ (NSError *)jks_errorWithDomain:(NSString *)domain
                            code:(NSInteger)code
                     description:(NSString *)description
                          reason:(NSString *)failureReason
                        userInfo:(NSDictionary *)dict;

@end
