//
//  UIBezierPath+JKSStrokeInside.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 6/25/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (JKSStrokeInside)

/* Similar to -stroke, but strokes on the inside instead of centering the stroke
 */
- (void)jks_strokeInside;

@end
