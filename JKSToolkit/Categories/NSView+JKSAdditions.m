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


#pragma mark - Auto Layout convenience methods

- (void)jks_addVisualConstraintsWithFormat:(NSString *)format views:(NSDictionary *)viewDict
{
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:viewDict]];
}


- (void)jks_addHorizontalCenterConstraintForView:(NSView *)fromView toView:(NSView *)toView
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:fromView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:toView
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0]];
}


- (void)jks_addVerticalCenterConstraintForView:(NSView *)fromView toView:(NSView *)toView
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:fromView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:toView
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
}

@end
