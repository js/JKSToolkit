//
//  NSImage+JKSAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 3/1/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (JKSAdditions)
- (NSImage *)jks_imageTintedWithColor:(NSColor *)tintColor;
@end
