//
//  NSView+JKSAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 5/24/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (JKSAdditions)

/** Draws a pattern color (from eg. -[NSImage colorWithPatternImage:] in the given rect
 *
 * @param color The pattern color to fill with
 * @param rect the rect that should be filled
 */
- (void)jks_drawPatternColor:(NSColor *)color inRect:(NSRect)rect;

/** Shorthand of the [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]] dance.
 * Constraints are added with default options and metrics.
 */
- (void)jks_addVisualConstraintsWithFormat:(NSString *)format views:(NSDictionary *)viewDict;

/** Centers fromView horizontally against toView's centerY */
- (void)jks_addHorizontalCenterConstraintForView:(NSView *)fromView toView:(NSView *)toView;

/** Centers fromView vertically against toView's centerX */
- (void)jks_addVerticalCenterConstraintForView:(NSView *)fromView toView:(NSView *)toView;

@end
