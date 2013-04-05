//
//  NSImage+JKSAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 3/1/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import "NSImage+JKSAdditions.h"
#import <QuartzCore/QuartzCore.h>

@implementation NSImage (JKSAdditions)
- (NSImage *)jks_imageTintedWithColor:(NSColor *)tintColor
{
    NSImage *tintedImage = [[NSImage alloc] initWithSize:[self size]];
    [tintedImage lockFocus];

    NSRect imageRect = (NSRect){
        .origin = {0, 0},
        .size = self.size
    };
    [self drawAtPoint:NSZeroPoint fromRect:imageRect operation:NSCompositeCopy fraction:1.0];
    [tintColor set];
    NSRectFillUsingOperation(imageRect, NSCompositeSourceAtop);

    [tintedImage unlockFocus];

    return tintedImage;
}
@end
