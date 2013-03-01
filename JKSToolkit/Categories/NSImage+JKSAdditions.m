//
//  NSImage+JKSAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 3/1/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import "NSImage+JKSAdditions.h"

@implementation NSImage (JKSAdditions)
- (NSImage *)jks_imageTintedWithColor:(NSColor *)tintColor
{
    __weak NSImage *weakSelf = self;
    return [NSImage imageWithSize:self.size flipped:self.isFlipped drawingHandler:^BOOL(NSRect dstRect) {
        __strong NSImage *strongSelf = weakSelf;
        NSRect imageRect = (NSRect){
            .origin = {0, 0},
            .size = strongSelf.size
        };
        [strongSelf drawAtPoint:NSZeroPoint fromRect:imageRect operation:NSCompositeCopy fraction:1.0];
        [tintColor set];
        NSRectFillUsingOperation(imageRect, NSCompositeSourceAtop);

        return YES;
    }];
}
@end
