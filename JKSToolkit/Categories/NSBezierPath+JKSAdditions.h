//
//  NSBezierPath+JKSAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 10/8/12.
//  Copyright (c) 2012 Johan Sørensen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSBezierPath (JKSAdditions)
- (void)jks_fillWithInnerShadow:(NSShadow *)shadow;
- (void)jks_strokeInside;
- (void)jks_strokeInsideWithinRect:(NSRect)clipRect;
@end
