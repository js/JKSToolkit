//
//  JKSView.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 10/22/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/** NSView subclass that draws in a flipped coordinate system and can draw via blocks
 */
@interface JKSView : NSView
/** A block that is called during -drawRect:
 */
@property (copy) void(^drawingHandler)(NSRect dirtyRect, NSRect bounds);
@end
