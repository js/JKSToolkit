//
//  JKSView.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 10/22/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import "JKSView.h"

@implementation JKSView

- (BOOL)isFlipped
{
    return YES;
}


- (void)drawRect:(NSRect)dirtyRect
{
    if (self.drawingHandler) {
        [[NSGraphicsContext currentContext] saveGraphicsState];
        self.drawingHandler(dirtyRect, [self bounds]);
        [[NSGraphicsContext currentContext] restoreGraphicsState];
    }
}

@end
