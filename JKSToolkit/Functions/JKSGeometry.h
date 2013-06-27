//
//  JKSGeometry.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 6/27/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import <CoreGraphics/CGGeometry.h>

/** Creates a new CGRect which is centered on the given point
 */
static inline CGRect JKSCGRectMakeWithCenter(CGPoint center, CGSize size)
{
    return CGRectMake(center.x - (size.width * 0.5 ), center.y - (size.height * 0.5), size.width, size.height);
}



/** Creates a CGRect from a top-left CGPoint spanning to a bottom right CGPoint
 */
static inline CGRect JKSCGRectMakeWithAnchorPoints(CGPoint topPoint, CGPoint bottomPoint)
{
    return CGRectMake(topPoint.x, topPoint.y, bottomPoint.x - topPoint.x, bottomPoint.y - topPoint.y);
}
