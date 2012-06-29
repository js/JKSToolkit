//
//  NSView+JKSAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/24/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "NSView+JKSAdditions.h"

@implementation NSView (JKSAdditions)

- (void)jks_drawPatternColor:(NSColor *)color inRect:(NSRect)rect
{
    [[NSGraphicsContext currentContext] saveGraphicsState];

    // Convert the patternphase to window offsets
    CGFloat offsetX = NSMinX([self convertRect:self.bounds toView:nil]);
    CGFloat offsetY = NSMaxY([self convertRect:self.bounds toView:nil]);
    [[NSGraphicsContext currentContext] setPatternPhase:NSMakePoint(offsetX, offsetY)];

    [color setFill];
    NSRectFill(rect);
    
    [[NSGraphicsContext currentContext] restoreGraphicsState];
}


- (void)jks_addVisualConstraintsWithFormat:(NSString *)format views:(NSDictionary *)viewDict
{
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:viewDict]];
}

@end
