//
//  NSString+JKSBase64.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/9/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JKSBase64)

- (NSString *)jks_base64EncodedString;
- (NSString *)jks_base64DecodedString;

@end
