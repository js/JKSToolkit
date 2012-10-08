//
//  NSBezierPath+JKSAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 10/8/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "NSBezierPath+JKSAdditions.h"

@implementation NSBezierPath (JKSAdditions)

//  From NSBezierPath+MCAdditions
//
//  Created by Sean Patrick O'Brien on 4/1/08.
//  Copyright 2008 MolokoCacao. All rights reserved.
- (void)jks_fillWithInnerShadow:(NSShadow *)shadow
{
	[NSGraphicsContext saveGraphicsState];

	NSSize offset = [shadow shadowOffset];
	NSSize originalOffset = offset;
	CGFloat radius = [shadow shadowBlurRadius];
	NSRect bounds = NSInsetRect([self bounds], -(fabs(offset.width) + radius), -(fabs(offset.height) + radius));
	offset.height += bounds.size.height;
	[shadow setShadowOffset:offset];

	NSAffineTransform *transform = [NSAffineTransform transform];
	if ([[NSGraphicsContext currentContext] isFlipped]) {
		[transform translateXBy:0 yBy:bounds.size.height];
	} else {
		[transform translateXBy:0 yBy:-bounds.size.height];
    }

	NSBezierPath *drawingPath = [NSBezierPath bezierPathWithRect:bounds];
	[drawingPath setWindingRule:NSEvenOddWindingRule];
	[drawingPath appendBezierPath:self];
	[drawingPath transformUsingAffineTransform:transform];

	[self addClip];
	[shadow set];
	[[NSColor blackColor] set];
	[drawingPath fill];

    [shadow setShadowOffset:originalOffset];

	[NSGraphicsContext restoreGraphicsState];
}


// Next two are from Matt Gemmell + Rainer Brockerhoff's NSBezierPath+StrokeInside
- (void)jks_strokeInside
{
    /* Stroke within path using no additional clipping rectangle. */
    [self jks_strokeInsideWithinRect:NSZeroRect];
}


- (void)jks_strokeInsideWithinRect:(NSRect)clipRect
{
    NSGraphicsContext *thisContext = [NSGraphicsContext currentContext];
    CGFloat lineWidth = [self lineWidth];

    /* Save the current graphics context. */
    [thisContext saveGraphicsState];

    /* Double the stroke width, since -stroke centers strokes on paths. */
    [self setLineWidth:(lineWidth * 2.0f)];

    /* Clip drawing to this path; draw nothing outwith the path. */
    [self setClip];

    /* Further clip drawing to clipRect, usually the view's frame. */
    if (clipRect.size.width > 0.0 && clipRect.size.height > 0.0) {
        [NSBezierPath clipRect:clipRect];
    }

    /* Stroke the path. */
    [self stroke];

    /* Restore the previous graphics context. */
    [thisContext restoreGraphicsState];
    [self setLineWidth:lineWidth];
}

@end
