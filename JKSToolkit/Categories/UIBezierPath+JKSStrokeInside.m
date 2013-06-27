//
//  UIBezierPath+JKSStrokeInside.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 6/25/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import "UIBezierPath+JKSStrokeInside.h"
#import <CoreGraphics/CGContext.h>

@implementation UIBezierPath (JKSStrokeInside)

// Next two are adapted to UIKit from Matt Gemmell + Rainer Brockerhoff's NSBezierPath+StrokeInside
- (void)jks_strokeInside
{
    /* Stroke within path using no additional clipping rectangle. */
    [self jks_strokeInsideWithinRect:CGRectZero];
}


- (void)jks_strokeInsideWithinRect:(CGRect)clipRect
{
    CGFloat lineWidth = [self lineWidth];

    CGContextRef context = UIGraphicsGetCurrentContext();
    /* Save the current graphics context. */
    CGContextSaveGState(context);

    /* Double the stroke width, since -stroke centers strokes on paths. */
    [self setLineWidth:(lineWidth * 2.0f)];

    /* Clip drawing to this path; draw nothing outwith the path. */
    [self addClip];

    /* Further clip drawing to clipRect, usually the view's frame. */
    if (clipRect.size.width > 0.0 && clipRect.size.height > 0.0) {
        //[NSBezierPath clipRect:clipRect];
        CGContextClipToRect(context, clipRect);
    }

    /* Stroke the path. */
    [self stroke];

    /* Restore the previous graphics context. */
    CGContextRestoreGState(context);
    [self setLineWidth:lineWidth];
}

@end
